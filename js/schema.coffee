#Project open data reporting schema
#For more information on the format, 
# see https://github.com/Baggz/Amanda/blob/master/docs/json/objects/schema.md
#
#For more information on the project open data schema, see http://project-open-data.github.io/schema/

require_if_available = () -> document.getElementById("require_if_available").checked
require_extended = () -> document.getElementById("require_extended").checked


rebuild_schema = () ->
  window.schema =
    type: "array"
    minItems: 1
    required: true
    uniqueItems: true
    items:
      type: "object"
      properties:

        #
        # required fields
        title:
          type: "string"
          required: true

        description:
          type: "string"
          required: true

        keyword:
          type: "string"
          required: true

        modified:
          type: "string"
          format: "date"
          required: true

        publisher:
          type: "string"
          required: true

        person:
          type: "string"
          required: true

        mbox:
          type: "string"
          required: true

        identifier:
          type: [ "string", "integer" ]
          required: true

        accessLevel:
          type: "string"
          required: true
          enum: [
            "public", "restricted public", "non-public"
          ]

        #
        # required if available
        dataDictionary:
          type: "string"
          format: "url"
          required: require_if_available()

        accessURL:
          type: "string"
          format: "url"
          required: require_if_available()

        format:
          type: [ "string", "array" ]
          required: require_if_available()

        license:
          type: "string"
          required: require_if_available()

        webService:
          type: "string"
          format: "url"
          required: require_if_available()

        spatial: {
          required: require_if_available()
        } # what format is this?

        temporal: {
          required: require_if_available()
        } # what format is this?


        #
        #expanded fields

        format:
          type: [ "string", "array" ]
          required: require_extended()

        issued:
          type: "string"
          format: "date"
          required: require_extended()

        accrualPeriodicity:
          type: "string"
          enum: ["hourly", "daily", "weekly", "yearly", "other"]
          required: require_extended()

        language:
          type: "string"
          required: require_extended()

        granularity:
          type: "string"
          required: require_extended()

        dataQuality:
          type: "string"
          required: require_extended()

        theme:
          type: "string"
          required: require_extended()

        references:
          type: "string"
          required: require_extended()

        distribution:
          type: [ "string", "array", "object" ]
          required: require_extended()

        size:
          type: [ "string", "integer" ]
          required: require_extended()


        download:
          type: "string"
          format: "url"
          required: require_extended()

        Feed:
          type: "string"
          format: "url"
          required: require_extended()

rebuild_schema()

window.rebuild_schema = rebuild_schema

