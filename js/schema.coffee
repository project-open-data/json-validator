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
          type: ["string", "array"]
          required: true

        modified:
          type: "string"
          # Amanda's built in "date-time" format is not broad enough to capture all variantes of ISO 8601, and specifically doesn't match the datetime output from inventory.data.gov. 
          # updated instead to use the regex suggested here: http://www.pelagodesign.com/blog/2009/05/20/iso-8601-date-validation-that-doesnt-suck/
          pattern: /^([\+-]?\d{4}(?!\d{2}\b))((-?)((0[1-9]|1[0-2])(\3([12]\d|0[1-9]|3[01]))?|W([0-4]\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\d|[12]\d{2}|3([0-5]\d|6[1-6])))([T\s]((([01]\d|2[0-3])((:?)[0-5]\d)?|24\:?00)([\.,]\d+(?!:))?)?(\17[0-5]\d([\.,]\d+)?)?([zZ]|([\+-])([01]\d|2[0-3]):?([0-5]\d)?)?)?)?$/
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

