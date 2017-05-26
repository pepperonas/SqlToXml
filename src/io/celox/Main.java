/*
 * Copyright (c) 2017 Martin Pfeffer
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package io.celox;

import io.celox.helper.MariaDb;
import io.celox.model.Attribute;
import io.celox.model.Tag;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.input.Clipboard;
import javafx.scene.input.ClipboardContent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.FileChooser;
import javafx.stage.Stage;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;

public class Main extends Application {

    private static final String TAG = "Main";


    @Override
    public void start(Stage primaryStage) throws Exception {
        ScrollPane scrollPane = new ScrollPane();
        primaryStage.setTitle("SqlToXml");
        Scene scene = new Scene(scrollPane, 500, 600);
        scrollPane.setPadding(new Insets(25, 25, 25, 25));
        primaryStage.setScene(scene);
        primaryStage.show();

        Button btnChooseFile = new Button("CHOOSE FILE");

        Label labelCounter = new Label("123");
        HBox hBox = new HBox(10);

        Label copyable = new Label("");
        copyable.getStyleClass().add("copyable-label");
        scene.getStylesheets().add(getClass().getResource("copyable-text.css").toExternalForm());

        VBox vBox = new VBox(10);
        vBox.setMinWidth(300);
        hBox.getChildren().addAll(vBox, labelCounter);
        vBox.getChildren().addAll(btnChooseFile, copyable);
        scrollPane.setContent(hBox);

        copyable.setOnMouseClicked(event -> {
            final ClipboardContent content = new ClipboardContent();
            content.putString(copyable.getText());
            Clipboard.getSystemClipboard().setContent(content);
        });

        btnChooseFile.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                generateXml();
            }

            private void generateXml() {
                FileChooser fileChooser = new FileChooser();
                fileChooser.setTitle("Choose .sql-file");
                fileChooser.getExtensionFilters().addAll(
                        new FileChooser.ExtensionFilter("Database files (*.sql)", "*.sql"));
                File file = fileChooser.showOpenDialog(scene.getWindow());

                if (file != null) {
                    HashMap<String, Tag> tags = readFile(file.getPath());
                    StringBuilder builder = new StringBuilder();
                    for (Tag _tag : tags.values()) {
                        try {
                            String msg = _tag.toString() + "\n\n";
                            builder.append(msg);
                            System.out.println(msg);
                        } catch (NullPointerException e) {
                            e.printStackTrace();
                        }
                    }
                    copyable.setText(builder.toString());
                    labelCounter.setText("Items: " + tags.size());
                } else {
                    copyable.setText("Nope!");
                }
            }
        });
    }

    private HashMap<String, Tag> readFile(String path) {
        HashMap<String, Tag> tags = new HashMap<>();

        BufferedReader bufferedReader = null;
        FileReader fileReader = null;
        try {
            fileReader = new FileReader(path);
            bufferedReader = new BufferedReader(fileReader);
            String line;
            bufferedReader = new BufferedReader(new FileReader(path));

            Tag tag = null;

            while ((line = bufferedReader.readLine()) != null) {
                if (line.contains(MariaDb.INDEX_INFORMATION)) {
                    return tags;
                }

                if (line.contains(MariaDb.CREATE_TABLE)) {

                    tag = new Tag(line.split(String.valueOf(MariaDb.QUOTES))[1]);

                } else if (!line.contains(";") && (tag != null) && line.contains("`") && !line.contains("TABLE") && !line.contains("--")) {
//                    System.out.println(line);
                    Attribute attribute = new Attribute(line.split("`")[1]);
                    tag.addAttribute(attribute);
                    tags.put(tag.getName(), tag);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (bufferedReader != null) {
                    bufferedReader.close();
                }
                if (fileReader != null) {
                    fileReader.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return tags;
    }

    public static void main(String[] args) {
        launch(args);
    }
}
