CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...

  config.toolbar_mini = [
    ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript"],
  ];
  config.toolbar = "simple";
  //config.skin = "minimalist,skins/minimalist/skin.js";

  // ... rest of the original config.js  ...
}
