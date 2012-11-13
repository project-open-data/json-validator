#Project open data reporting schema
#For more information on the format, 
# see https://github.com/Baggz/Amanda/blob/master/docs/json/objects/schema.md

window.schema =
  type: "array"
  minItems: 1
  required: true
  uniqueItems: true
  items:
    type: "object"
    properties:
      
      #basic fields
      
      title:
        type: "string"
        required: true
      
      description:
        type: "string"
        required: true
      
      dataDictionary:
        type: "string"
        format: "url"
        required: true
      
      accessURL:
        type: "string"
        format: "url"
        required: true 
      
      keywords:
        type: "array"
        required: true
        minItems: 1
        items:
          type: "string" 
      
      license:
        type: "string"
        required: true
      
      public:
        type: "boolean"
        required: true
        
      organization:
        type: "string"
        required: true
        
      #expanded fields
      
      modified:
        type: "string"
        format: "datetime"
      
      format:
        type: [ "string", "array" ]
      
      publisher:
        type: "string"
        
      issued:
        type: "string"
        format: "datetime"
      
      accrualPeriodicity:
        type: "string"
      
      identifier:
        type: [ "string", "integer" ]
        
      spatial: {} # what format is this?
      
      temporal: {} # what format is this?
      
      language: 
        type: "string"
      
      granularity:
        type: "string"

      dataQuality:
        type: "string"
        
      theme:
        type: "string"
        
      references:
        type: "object"
      
      distribution:
        type: [ "string", "array", "object" ]
      
      size:
        type: [ "string", "integer" ]
      
      format: 
        type: [ "string", "array" ]
      
      download:
        type: "string"
        format: "url"
      
      WebService:
        type: "string"
        format: "url"
        
      Feed:
        type: "string"
        format: "url"