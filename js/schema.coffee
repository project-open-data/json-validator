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
          # This is supposed to be an array of strings (i.e. ["education", "school choice"], but allowing plain strings for now.
          type: ["string", "array"]
          required: true

        modified:
          type: "string"
          # Amanda's built in "date-time" format is not broad enough to capture all variants of ISO 8601, and specifically doesn't match the datetime output from inventory.data.gov. 
          # updated instead to use the regex suggested here: http://www.pelagodesign.com/blog/2009/05/20/iso-8601-date-validation-that-doesnt-suck/
          pattern: /^([\+-]?\d{4}(?!\d{2}\b))((-?)((0[1-9]|1[0-2])(\3([12]\d|0[1-9]|3[01]))?|W([0-4]\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\d|[12]\d{2}|3([0-5]\d|6[1-6])))([T\s]((([01]\d|2[0-3])((:?)[0-5]\d)?|24\:?00)([\.,]\d+(?!:))?)?(\17[0-5]\d([\.,]\d+)?)?([zZ]|([\+-])([01]\d|2[0-3]):?([0-5]\d)?)?)?)?$/
          required: true

        publisher:
          type: "string"
          required: true

        contactPoint:
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
          #note I am hacking in "public restricted" because inventory.data.gov currently has the wrong Enums. Should remove "public restricted" once they fix it https://github.com/GSA/enterprise-data-inventory/issues/16
          enum: [
            "public", "restricted public", "non-public", "public restricted"
          ]

        #
        # required if available
        dataDictionary:
          type: "string"
          # Amanda's built in URL regex was not matching valid URLs, so I used this one: https://gist.github.com/dperini/729294
          pattern: /^(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?$/i
          required: require_if_available()

        accessURL:
          type: "string"
          # Amanda's built in URL regex was not matching valid URLs, so I used this one: https://gist.github.com/dperini/729294
          pattern: /^(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?$/i
          required: require_if_available()

        bureauCode:
          type: "string"
          pattern: /\d{3}:\d{2}/
          required: require_if_available()

        programCode:
          type: "string"
          pattern: /\d{3}:\d{2}/
          required: require_if_available()

        format:
          type: [ "string", "array" ]
          required: require_if_available()

        license:
          type: "string"
          required: require_if_available()

        webService:
          type: "string"
          # Amanda's built in URL regex was not matching valid URLs, so I used this one: https://gist.github.com/dperini/729294
          pattern: /^(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?$/i
          required: require_if_available()

        spatial: {
          required: require_if_available()
        } # what format is this?

        temporal: {
          required: require_if_available()
        } # should be ISO 8601 but I can't find a good regex that allows the range format to be expressed.


        #
        #expanded fields

        format:
          type: [ "string", "array" ]
          required: require_extended()

        issued:
          type: "string"
          # Amanda's built in "date-time" format is not broad enough to capture all variants of ISO 8601, and specifically doesn't match the datetime output from inventory.data.gov. 
          # updated instead to use the regex suggested here: http://www.pelagodesign.com/blog/2009/05/20/iso-8601-date-validation-that-doesnt-suck/
          pattern: /^([\+-]?\d{4}(?!\d{2}\b))((-?)((0[1-9]|1[0-2])(\3([12]\d|0[1-9]|3[01]))?|W([0-4]\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\d|[12]\d{2}|3([0-5]\d|6[1-6])))([T\s]((([01]\d|2[0-3])((:?)[0-5]\d)?|24\:?00)([\.,]\d+(?!:))?)?(\17[0-5]\d([\.,]\d+)?)?([zZ]|([\+-])([01]\d|2[0-3]):?([0-5]\d)?)?)?)?$/
          required: require_extended()

        accrualPeriodicity:
          type: "string"
          enum: ["Annual","Bimonthly","Semiweekly","Daily","Biweekly","Semiannual","Biennial","Triennial","Three times a week","Three times a month","Continuously updated","Monthly","Quarterly","Semimonthly","Three times a year","Weekly","Completely irregular","annual","bimonthly","semiweekly","daily","biweekly","semiannual","biennial","triennial","three times a week","three times a month","continuously updated","monthly","quarterly","semimonthly","three times a year","weekly","completely irregular"]
          required: require_extended()

        language:
          # Language is supposed to be an array of strings (i.e. ["en-US"]) but allowing strings only for now.
          type: ["string", "array"]
          required: require_extended()

        granularity:
          type: "string"
          required: require_extended()

        dataQuality:
          type: "boolean"
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
          # Amanda's built in URL regex was not matching valid URLs, so I used this one: https://gist.github.com/dperini/729294
          pattern: /^(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?$/i
          required: require_extended()

        Feed:
          type: "string"
          # Amanda's built in URL regex was not matching valid URLs, so I used this one: https://gist.github.com/dperini/729294
          pattern: /^(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?$/i
          required: require_extended()

rebuild_schema()

window.rebuild_schema = rebuild_schema

