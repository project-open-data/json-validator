#Project open data reporting schema
#For more information on the format, 
# see https://github.com/Baggz/Amanda/blob/master/docs/json/objects/schema.md

window.schema =
  type: "array"
  items:
    type: "object"
    properties:
      
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