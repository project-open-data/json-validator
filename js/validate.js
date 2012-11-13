// Generated by CoffeeScript 1.4.0
(function() {
  var ProjectOpenDataValidator,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  ProjectOpenDataValidator = (function() {

    ProjectOpenDataValidator.prototype.feedback = $('#feedback');

    ProjectOpenDataValidator.prototype.input = $('#input');

    ProjectOpenDataValidator.prototype.codeMirrorOptions = {
      mode: {
        name: "javascript",
        json: true
      },
      onChange: function() {
        return project_open_data_validator.validate();
      },
      lineNumbers: true,
      autofocus: true
    };

    ProjectOpenDataValidator.prototype.validatorOptions = {};

    function ProjectOpenDataValidator() {
      this.validate = __bind(this.validate, this);
      this.codeMirror = CodeMirror.fromTextArea(this.input[0], this.codeMirrorOptions);
      this.validator = amanda('json');
      this.validate();
    }

    ProjectOpenDataValidator.prototype.validate = function() {
      return this.validator.validate(this.codeMirror.getValue(), schema, this.validatorOptions, function(e) {
        if (e != null) {
          return $(this.feedback).html(e.getMessages().join(' :(<br /> ') + ' :(').removeClass('valid');
        } else {
          return $(this.feedback).html('Valid :)').addClass('valid');
        }
      });
    };

    return ProjectOpenDataValidator;

  })();

  jQuery(document).ready(function($) {
    return window.project_open_data_validator = new ProjectOpenDataValidator;
  });

}).call(this);
