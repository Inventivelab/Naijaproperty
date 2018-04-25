CKEDITOR.editorConfig = (config) ->
  config.uiColor = "#e6efee"
  config.language = 'en'
  config.toolbar_Pure = [
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline','Strike','-','RemoveFormat' ] },
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList','-','Outdent','Indent','-','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-', ] },
    { name: 'links',       items: [ 'Link','Unlink','Anchor' ] },
    { name: 'document',    items: [ '-','DocProps','Preview','-','Templates' ] },
    { name: 'clipboard',   items: [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
    '/',
    { name: 'styles',      items: [ 'Styles','Format','Font','FontSize' ] },
    { name: 'colors',      items: [ 'TextColor','BGColor' ] },
    { name: 'insert',      items: [ 'SpecialChar' ] },
    { name: 'editing',     items: [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
    { name: 'tools',       items: [ 'ShowBlocks','-' ] }
  ]
  config.toolbar = 'Pure'
  true
