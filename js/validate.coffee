#Main validator class
#Available in the global scope as a single "project_open_data_validator" object
class ProjectOpenDataValidator
  
  #Feedback element
  feedback: $('#feedback')
  
  #Editor element
  input: $('#input')
  
  #Editor options
  # see http://codemirror.net/doc/manual.html
  codeMirrorOptions:
    mode:                                     #editor mode, here JSON
      name: "javascript"
      json: true
    onChange: ->                              #event to fire on change
      project_open_data_validator.validate()  #note, this should be to @, but I can't get it to work
    lineNumbers: true                         #display line numbers
    autofocus: true                           #get focus on load
  
  #validator options
  # see https://github.com/Baggz/Amanda/blob/master/docs/json/objects/options.md
  validatorOptions: {}
  
  #init codemirror, validator, and validate on load
  constructor: ->
    @codeMirror = CodeMirror.fromTextArea @input[0], @codeMirrorOptions
    @validator = amanda 'json'
    @validate()
  
  #callback to validate current contents of editor on change
  validate: =>

    #validate and propegate feedback
    @validator.validate @codeMirror.getValue(), schema, @validatorOptions, (e) ->
      if e?
        $(@feedback).html( e.getMessages().join( ' :(<br /> ' ) + ' :(' ).removeClass 'valid'
      else 
        $(@feedback).html( 'Valid :)' ).addClass 'valid'
  
#When the document's ready, load our class 
jQuery(document).ready ($) ->
  window.project_open_data_validator = new ProjectOpenDataValidator
   
