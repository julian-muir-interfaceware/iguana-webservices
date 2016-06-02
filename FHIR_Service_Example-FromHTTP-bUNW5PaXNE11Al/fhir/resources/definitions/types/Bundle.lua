-- Taken from:
--  https://www.hl7.org/fhir/bundle.profile.json.html
--  https://www.hl7.org/fhir/bundle.profile.xml.html
local Bundle = {}

Bundle.json =
[[
{
  "resourceType": "StructureDefinition",
  "id": "Bundle",
  "meta": {
    "lastUpdated": "2015-10-24T07:41:03.495+11:00"
  },
  "text": {
    "status": "generated",
    "div": "<div>!-- Snipped for Brevity --></div>"
  },
  "extension": [
    {
      "url": "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm",
      "valueInteger": 2
    }
  ],
  "url": "http://hl7.org/fhir/StructureDefinition/Bundle",
  "name": "Bundle",
  "status": "draft",
  "publisher": "Health Level Seven International (FHIR Infrastructure)",
  "contact": [
    {
      "telecom": [
        {
          "system": "other",
          "value": "http://hl7.org/fhir"
        }
      ]
    },
    {
      "telecom": [
        {
          "system": "other",
          "value": "http://www.hl7.org/Special/committees/fiwg/index.cfm"
        }
      ]
    }
  ],
  "date": "2015-10-24T07:41:03+11:00",
  "description": "Base StructureDefinition for Bundle Resource",
  "fhirVersion": "1.0.2",
  "mapping": [
    {
      "identity": "v2",
      "uri": "http://hl7.org/v2",
      "name": "HL7 v2"
    },
    {
      "identity": "rim",
      "uri": "http://hl7.org/v3",
      "name": "RIM"
    },
    {
      "identity": "w5",
      "uri": "http://hl7.org/fhir/w5",
      "name": "W5 Mapping"
    }
  ],
  "kind": "resource",
  "abstract": false,
  "base": "http://hl7.org/fhir/StructureDefinition/Resource",
  "snapshot": {
    "element": [
      {
        "path": "Bundle",
        "short": "Contains a collection of resources",
        "definition": "A container for a collection of resources.",
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "Resource"
          }
        ],
        "constraint": [
          {
            "key": "bdl-2",
            "severity": "error",
            "human": "entry.search only when a search",
            "xpath": "not(f:entry/f:search) or (f:type/@value = 'searchset')"
          },
          {
            "key": "bdl-1",
            "severity": "error",
            "human": "total only when a search or history",
            "xpath": "not(f:total) or (f:type/@value = 'searchset') or (f:type/@value = 'history')"
          },
          {
            "key": "bdl-7",
            "severity": "error",
            "human": "FullUrl must be unique in a bundle, or else entries with the same fullUrl must have different meta.versionId",
            "xpath": "count(for $entry in f:entry[f:resource] return $entry[count(parent::f:Bundle/f:entry[f:fullUrl/@value=$entry/f:fullUrl/@value and ((not(f:resource/*/f:meta/f:versionId/@value) and not($entry/f:resource/*/f:meta/f:versionId/@value)) or f:resource/*/f:meta/f:versionId/@value=$entry/f:resource/*/f:meta/f:versionId/@value)])!=1])=0"
          },
          {
            "key": "bdl-3",
            "severity": "error",
            "human": "entry.request only for some types of bundles",
            "xpath": "not(f:entry/f:request) or (f:type/@value = 'batch') or (f:type/@value = 'transaction') or (f:type/@value = 'history')"
          },
          {
            "key": "bdl-4",
            "severity": "error",
            "human": "entry.response only for some types of bundles",
            "xpath": "not(f:entry/f:response) or (f:type/@value = 'batch-response') or (f:type/@value = 'transaction-response')"
          }
        ],
        "isSummary": true,
        "mapping": [
          {
            "identity": "v2",
            "map": "N/A"
          },
          {
            "identity": "rim",
            "map": "N/A"
          },
          {
            "identity": "w5",
            "map": "infrastructure.structure"
          }
        ]
      },
      {
        "path": "Bundle.id",
        "short": "Logical id of this artifact",
        "definition": "The logical id of the resource, as used in the URL for the resource. Once assigned, this value never changes.",
        "comments": "The only time that a resource does not have an id is when it is being submitted to the server using a create operation. Bundles always have an id, though it is usually a generated UUID.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "id"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.meta",
        "short": "Metadata about the resource",
        "definition": "The metadata about the resource. This is content that is maintained by the infrastructure. Changes to the content may not always be associated with version changes to the resource.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "Meta"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.implicitRules",
        "short": "A set of rules under which this content was created",
        "definition": "A reference to a set of rules that were followed when the resource was constructed, and which must be understood when processing the content.",
        "comments": "Asserting this rule set restricts the content to be only understood by a limited set of trading partners. This inherently limits the usefulness of the data in the long term. However, the existing health eco-system is highly fractured, and not yet ready to define, collect, and exchange data in a generally computable sense. Wherever possible, implementers and/or specification writers should avoid using this element as much as possible.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "uri"
          }
        ],
        "isModifier": true,
        "isSummary": true
      },
      {
        "path": "Bundle.language",
        "short": "Language of the resource content",
        "definition": "The base language in which the resource is written.",
        "comments": "Language is provided to support indexing and accessibility (typically, services such as text to speech use the language tag). The html language tag in the narrative applies  to the narrative. The language tag on the resource may be used to specify the language of other presentations generated from the data in the resource  Not all the content has to be in the base language. The Resource.language should not be assumed to apply to the narrative automatically. If a language is specified, it should it also be specified on the div element in the html (see rules in HTML5 for information about the relationship between xml:lang and the html lang attribute).",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "code"
          }
        ],
        "binding": {
          "strength": "required",
          "description": "A human language.",
          "valueSetUri": "http://tools.ietf.org/html/bcp47"
        }
      },
      {
        "path": "Bundle.type",
        "short": "document | message | transaction | transaction-response | batch | batch-response | history | searchset | collection",
        "definition": "Indicates the purpose of this bundle- how it was intended to be used.",
        "comments": "It's possible to use a bundle for other purposes (e.g. a document can be accepted as a transaction). This is primarily defined so that there can be specific rules for some of the bundle types.",
        "min": 1,
        "max": "1",
        "type": [
          {
            "code": "code"
          }
        ],
        "isSummary": true,
        "binding": {
          "strength": "required",
          "description": "Indicates the purpose of a bundle - how it was intended to be used.",
          "valueSetReference": {
            "reference": "http://hl7.org/fhir/ValueSet/bundle-type"
          }
        },
        "mapping": [
          {
            "identity": "w5",
            "map": "class"
          }
        ]
      },
      {
        "path": "Bundle.total",
        "short": "If search, the total number of matches",
        "definition": "If a set of search matches, this is the total number of matches for the search (as opposed to the number of results in this bundle).",
        "comments": "Only used if the bundle is a search result set.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "unsignedInt"
          }
        ],
        "condition": [
          "bdl-1"
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.link",
        "name": "link",
        "short": "Links related to this Bundle",
        "definition": "A series of links that provide context to this bundle.",
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "BackboneElement"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.link.id",
        "representation": [
          "xmlAttr"
        ],
        "short": "xml:id (or equivalent in JSON)",
        "definition": "unique id for the element within a resource (for internal references).",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "id"
          }
        ],
        "mapping": [
          {
            "identity": "rim",
            "map": "n/a"
          }
        ]
      },
      {
        "path": "Bundle.link.extension",
        "short": "Additional Content defined by implementations",
        "definition": "May be used to represent additional information that is not part of the basic definition of the element. In order to make the use of extensions safe and manageable, there is a strict set of governance  applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension.",
        "comments": "There can be no stigma associated with the use of extensions by any application, project, or standard - regardless of the institution or jurisdiction that uses or defines the extensions.  The use of extensions is what allows the FHIR specification to retain a core level of simplicity for everyone.",
        "alias": [
          "extensions",
          "user content"
        ],
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "Extension"
          }
        ],
        "mapping": [
          {
            "identity": "rim",
            "map": "n/a"
          }
        ]
      },
      {
        "path": "Bundle.link.modifierExtension",
        "short": "Extensions that cannot be ignored",
        "definition": "May be used to represent additional information that is not part of the basic definition of the element, and that modifies the understanding of the element that contains it. Usually modifier elements provide negation or qualification. In order to make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension. Applications processing a resource are required to check for modifier extensions.",
        "comments": "There can be no stigma associated with the use of extensions by any application, project, or standard - regardless of the institution or jurisdiction that uses or defines the extensions.  The use of extensions is what allows the FHIR specification to retain a core level of simplicity for everyone.",
        "alias": [
          "extensions",
          "user content",
          "modifiers"
        ],
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "Extension"
          }
        ],
        "isModifier": true,
        "mapping": [
          {
            "identity": "rim",
            "map": "N/A"
          }
        ]
      },
      {
        "path": "Bundle.link.relation",
        "short": "http://www.iana.org/assignments/link-relations/link-relations.xhtml",
        "definition": "A name which details the functional use for this link - see http://www.iana.org/assignments/link-relations/link-relations.xhtml.",
        "min": 1,
        "max": "1",
        "type": [
          {
            "code": "string"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.link.url",
        "short": "Reference details for the link",
        "definition": "The reference details for the link.",
        "min": 1,
        "max": "1",
        "type": [
          {
            "code": "uri"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry",
        "short": "Entry in the bundle - will have a resource, or information",
        "definition": "An entry in a bundle resource - will either contain a resource, or information about a resource (transactions and history only).",
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "BackboneElement"
          }
        ],
        "constraint": [
          {
            "key": "bdl-5",
            "severity": "error",
            "human": "must be a resource unless there's a request or response",
            "xpath": "f:resource or f:request or f:response"
          },
          {
            "key": "bdl-6",
            "severity": "error",
            "human": "The fullUrl element must be present when a resource is present, and not present otherwise",
            "xpath": "(not(exists(f:fullUrl)) and not(exists(f:resource))) or (exists(f:fullUrl) and exists(f:resource))"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.id",
        "representation": [
          "xmlAttr"
        ],
        "short": "xml:id (or equivalent in JSON)",
        "definition": "unique id for the element within a resource (for internal references).",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "id"
          }
        ],
        "mapping": [
          {
            "identity": "rim",
            "map": "n/a"
          }
        ]
      },
      {
        "path": "Bundle.entry.extension",
        "short": "Additional Content defined by implementations",
        "definition": "May be used to represent additional information that is not part of the basic definition of the element. In order to make the use of extensions safe and manageable, there is a strict set of governance  applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension.",
        "comments": "There can be no stigma associated with the use of extensions by any application, project, or standard - regardless of the institution or jurisdiction that uses or defines the extensions.  The use of extensions is what allows the FHIR specification to retain a core level of simplicity for everyone.",
        "alias": [
          "extensions",
          "user content"
        ],
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "Extension"
          }
        ],
        "mapping": [
          {
            "identity": "rim",
            "map": "n/a"
          }
        ]
      },
      {
        "path": "Bundle.entry.modifierExtension",
        "short": "Extensions that cannot be ignored",
        "definition": "May be used to represent additional information that is not part of the basic definition of the element, and that modifies the understanding of the element that contains it. Usually modifier elements provide negation or qualification. In order to make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension. Applications processing a resource are required to check for modifier extensions.",
        "comments": "There can be no stigma associated with the use of extensions by any application, project, or standard - regardless of the institution or jurisdiction that uses or defines the extensions.  The use of extensions is what allows the FHIR specification to retain a core level of simplicity for everyone.",
        "alias": [
          "extensions",
          "user content",
          "modifiers"
        ],
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "Extension"
          }
        ],
        "isModifier": true,
        "mapping": [
          {
            "identity": "rim",
            "map": "N/A"
          }
        ]
      },
      {
        "path": "Bundle.entry.link",
        "short": "Links related to this entry",
        "definition": "A series of links that provide context to this entry.",
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "BackboneElement"
          }
        ],
        "nameReference": "link",
        "isSummary": true
      },
      {
        "path": "Bundle.entry.fullUrl",
        "short": "Absolute URL for resource (server address, or UUID/OID)",
        "definition": "The Absolute URL for the resource. This must be provided for all resources. The fullUrl SHALL not disagree with the id in the resource. The fullUrl is a version independent reference to the resource.",
        "comments": "fullUrl may not be [unique in the context of a resource](bundle.html#bundle-unique). Note that since [FHIR resources do not need to be served through the FHIR API](references.html), the absolute URL may not end with the logical id of the resource (Resource.id), but if the fullUrl does look like a RESTful server URL (e.g. meets the [regex](references.html#regex), then it SHALL end with the Resource.id.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "uri"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.resource",
        "short": "A resource in the bundle",
        "definition": "The Resources for the entry.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "Resource"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.search",
        "short": "Search related information",
        "definition": "Information about the search process that lead to the creation of this entry.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "BackboneElement"
          }
        ],
        "condition": [
          "bdl-2"
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.search.id",
        "representation": [
          "xmlAttr"
        ],
        "short": "xml:id (or equivalent in JSON)",
        "definition": "unique id for the element within a resource (for internal references).",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "id"
          }
        ],
        "mapping": [
          {
            "identity": "rim",
            "map": "n/a"
          }
        ]
      },
      {
        "path": "Bundle.entry.search.extension",
        "short": "Additional Content defined by implementations",
        "definition": "May be used to represent additional information that is not part of the basic definition of the element. In order to make the use of extensions safe and manageable, there is a strict set of governance  applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension.",
        "comments": "There can be no stigma associated with the use of extensions by any application, project, or standard - regardless of the institution or jurisdiction that uses or defines the extensions.  The use of extensions is what allows the FHIR specification to retain a core level of simplicity for everyone.",
        "alias": [
          "extensions",
          "user content"
        ],
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "Extension"
          }
        ],
        "mapping": [
          {
            "identity": "rim",
            "map": "n/a"
          }
        ]
      },
      {
        "path": "Bundle.entry.search.modifierExtension",
        "short": "Extensions that cannot be ignored",
        "definition": "May be used to represent additional information that is not part of the basic definition of the element, and that modifies the understanding of the element that contains it. Usually modifier elements provide negation or qualification. In order to make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension. Applications processing a resource are required to check for modifier extensions.",
        "comments": "There can be no stigma associated with the use of extensions by any application, project, or standard - regardless of the institution or jurisdiction that uses or defines the extensions.  The use of extensions is what allows the FHIR specification to retain a core level of simplicity for everyone.",
        "alias": [
          "extensions",
          "user content",
          "modifiers"
        ],
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "Extension"
          }
        ],
        "isModifier": true,
        "mapping": [
          {
            "identity": "rim",
            "map": "N/A"
          }
        ]
      },
      {
        "path": "Bundle.entry.search.mode",
        "short": "match | include | outcome - why this is in the result set",
        "definition": "Why this entry is in the result set - whether it's included as a match or because of an _include requirement.",
        "comments": "There is only one mode. In some corner cases, a resource may be included because it is both a match and an include. In these circumstances, 'match' takes precedence.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "code"
          }
        ],
        "isSummary": true,
        "binding": {
          "strength": "required",
          "description": "Why an entry is in the result set - whether it's included as a match or because of an _include requirement.",
          "valueSetReference": {
            "reference": "http://hl7.org/fhir/ValueSet/search-entry-mode"
          }
        }
      },
      {
        "path": "Bundle.entry.search.score",
        "short": "Search ranking (between 0 and 1)",
        "definition": "When searching, the server's search ranking score for the entry.",
        "comments": "Servers are not required to return a ranking score. 1 is most relevant, and 0 is least relevant. Often, search results are sorted by score, but the client may specify a different sort order.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "decimal"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.request",
        "short": "Transaction Related Information",
        "definition": "Additional information about how this entry should be processed as part of a transaction.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "BackboneElement"
          }
        ],
        "condition": [
          "bdl-3"
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.request.id",
        "representation": [
          "xmlAttr"
        ],
        "short": "xml:id (or equivalent in JSON)",
        "definition": "unique id for the element within a resource (for internal references).",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "id"
          }
        ],
        "mapping": [
          {
            "identity": "rim",
            "map": "n/a"
          }
        ]
      },
      {
        "path": "Bundle.entry.request.extension",
        "short": "Additional Content defined by implementations",
        "definition": "May be used to represent additional information that is not part of the basic definition of the element. In order to make the use of extensions safe and manageable, there is a strict set of governance  applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension.",
        "comments": "There can be no stigma associated with the use of extensions by any application, project, or standard - regardless of the institution or jurisdiction that uses or defines the extensions.  The use of extensions is what allows the FHIR specification to retain a core level of simplicity for everyone.",
        "alias": [
          "extensions",
          "user content"
        ],
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "Extension"
          }
        ],
        "mapping": [
          {
            "identity": "rim",
            "map": "n/a"
          }
        ]
      },
      {
        "path": "Bundle.entry.request.modifierExtension",
        "short": "Extensions that cannot be ignored",
        "definition": "May be used to represent additional information that is not part of the basic definition of the element, and that modifies the understanding of the element that contains it. Usually modifier elements provide negation or qualification. In order to make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension. Applications processing a resource are required to check for modifier extensions.",
        "comments": "There can be no stigma associated with the use of extensions by any application, project, or standard - regardless of the institution or jurisdiction that uses or defines the extensions.  The use of extensions is what allows the FHIR specification to retain a core level of simplicity for everyone.",
        "alias": [
          "extensions",
          "user content",
          "modifiers"
        ],
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "Extension"
          }
        ],
        "isModifier": true,
        "mapping": [
          {
            "identity": "rim",
            "map": "N/A"
          }
        ]
      },
      {
        "path": "Bundle.entry.request.method",
        "short": "GET | POST | PUT | DELETE",
        "definition": "The HTTP verb for this entry in either a update history, or a transaction/ transaction response.",
        "min": 1,
        "max": "1",
        "type": [
          {
            "code": "code"
          }
        ],
        "isSummary": true,
        "binding": {
          "strength": "required",
          "description": "HTTP verbs (in the HTTP command line).",
          "valueSetReference": {
            "reference": "http://hl7.org/fhir/ValueSet/http-verb"
          }
        }
      },
      {
        "path": "Bundle.entry.request.url",
        "short": "URL for HTTP equivalent of this entry",
        "definition": "The URL for this entry, relative to the root (the address to which the request is posted).",
        "comments": "E.g. for a Patient Create, the method would be \"POST\" and the URL would be \"Patient\". For a Patient Update, the method would be PUT, and the URL would be \"Patient/[id]\".",
        "min": 1,
        "max": "1",
        "type": [
          {
            "code": "uri"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.request.ifNoneMatch",
        "short": "For managing cache currency",
        "definition": "If the ETag values match, return a 304 Not modified status. See the API documentation for [\"Conditional Read\"](http.html#cread).",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "string"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.request.ifModifiedSince",
        "short": "For managing update contention",
        "definition": "Only perform the operation if the last updated date matches. See the API documentation for [\"Conditional Read\"](http.html#cread).",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "instant"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.request.ifMatch",
        "short": "For managing update contention",
        "definition": "Only perform the operation if the Etag value matches. For more information, see the API section [\"Managing Resource Contention\"](http.html#concurrency).",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "string"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.request.ifNoneExist",
        "short": "For conditional creates",
        "definition": "Instruct the server not to perform the create if a specified resource already exists. For further information, see the API documentation for [\"Conditional Create\"](http.html#ccreate). This is just the query portion of the URL - what follows the \"?\" (not including the \"?\").",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "string"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.response",
        "short": "Transaction Related Information",
        "definition": "Additional information about how this entry should be processed as part of a transaction.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "BackboneElement"
          }
        ],
        "condition": [
          "bdl-4"
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.response.id",
        "representation": [
          "xmlAttr"
        ],
        "short": "xml:id (or equivalent in JSON)",
        "definition": "unique id for the element within a resource (for internal references).",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "id"
          }
        ],
        "mapping": [
          {
            "identity": "rim",
            "map": "n/a"
          }
        ]
      },
      {
        "path": "Bundle.entry.response.extension",
        "short": "Additional Content defined by implementations",
        "definition": "May be used to represent additional information that is not part of the basic definition of the element. In order to make the use of extensions safe and manageable, there is a strict set of governance  applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension.",
        "comments": "There can be no stigma associated with the use of extensions by any application, project, or standard - regardless of the institution or jurisdiction that uses or defines the extensions.  The use of extensions is what allows the FHIR specification to retain a core level of simplicity for everyone.",
        "alias": [
          "extensions",
          "user content"
        ],
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "Extension"
          }
        ],
        "mapping": [
          {
            "identity": "rim",
            "map": "n/a"
          }
        ]
      },
      {
        "path": "Bundle.entry.response.modifierExtension",
        "short": "Extensions that cannot be ignored",
        "definition": "May be used to represent additional information that is not part of the basic definition of the element, and that modifies the understanding of the element that contains it. Usually modifier elements provide negation or qualification. In order to make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension. Applications processing a resource are required to check for modifier extensions.",
        "comments": "There can be no stigma associated with the use of extensions by any application, project, or standard - regardless of the institution or jurisdiction that uses or defines the extensions.  The use of extensions is what allows the FHIR specification to retain a core level of simplicity for everyone.",
        "alias": [
          "extensions",
          "user content",
          "modifiers"
        ],
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "Extension"
          }
        ],
        "isModifier": true,
        "mapping": [
          {
            "identity": "rim",
            "map": "N/A"
          }
        ]
      },
      {
        "path": "Bundle.entry.response.status",
        "short": "Status return code for entry",
        "definition": "The status code returned by processing this entry.",
        "min": 1,
        "max": "1",
        "type": [
          {
            "code": "string"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.response.location",
        "short": "The location, if the operation returns a location",
        "definition": "The location header created by processing this operation.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "uri"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.response.etag",
        "short": "The etag for the resource (if relevant)",
        "definition": "The etag for the resource, it the operation for the entry produced a versioned resource.",
        "comments": "This has to match the version id in the header if a resource is included.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "string"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.response.lastModified",
        "short": "Server's date time modified",
        "definition": "The date/time that the resource was modified on the server.",
        "comments": "This has to match the same time in the meta header if a resource is included.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "instant"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.signature",
        "short": "Digital Signature",
        "definition": "Digital Signature - base64 encoded. XML DigSIg or a JWT.",
        "comments": "The signature could be created by the \"author\" of the bundle or by the originating device.   Requirements around inclusion of a signature, verification of signatures and treatment of signed/non-signed bundles is implementation-environment specific.",
        "requirements": "This element allows capturing signatures on documents. It also allows signatures on messages, transactions or even query responses. It may support content-authentication, non-repudiation or other business cases. This is primarily relevant where the bundle may travel through multiple hops or via other mechanisms where HTTPS non-repudiation is insufficient.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "Signature"
          }
        ],
        "isSummary": true
      }
    ]
  },
  "differential": {
    "element": [
      {
        "path": "Bundle",
        "short": "Contains a collection of resources",
        "definition": "A container for a collection of resources.",
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "Resource"
          }
        ],
        "constraint": [
          {
            "key": "bdl-2",
            "severity": "error",
            "human": "entry.search only when a search",
            "xpath": "not(f:entry/f:search) or (f:type/@value = 'searchset')"
          },
          {
            "key": "bdl-1",
            "severity": "error",
            "human": "total only when a search or history",
            "xpath": "not(f:total) or (f:type/@value = 'searchset') or (f:type/@value = 'history')"
          },
          {
            "key": "bdl-7",
            "severity": "error",
            "human": "FullUrl must be unique in a bundle, or else entries with the same fullUrl must have different meta.versionId",
            "xpath": "count(for $entry in f:entry[f:resource] return $entry[count(parent::f:Bundle/f:entry[f:fullUrl/@value=$entry/f:fullUrl/@value and ((not(f:resource/*/f:meta/f:versionId/@value) and not($entry/f:resource/*/f:meta/f:versionId/@value)) or f:resource/*/f:meta/f:versionId/@value=$entry/f:resource/*/f:meta/f:versionId/@value)])!=1])=0"
          },
          {
            "key": "bdl-3",
            "severity": "error",
            "human": "entry.request only for some types of bundles",
            "xpath": "not(f:entry/f:request) or (f:type/@value = 'batch') or (f:type/@value = 'transaction') or (f:type/@value = 'history')"
          },
          {
            "key": "bdl-4",
            "severity": "error",
            "human": "entry.response only for some types of bundles",
            "xpath": "not(f:entry/f:response) or (f:type/@value = 'batch-response') or (f:type/@value = 'transaction-response')"
          }
        ],
        "isSummary": true,
        "mapping": [
          {
            "identity": "v2",
            "map": "N/A"
          },
          {
            "identity": "rim",
            "map": "N/A"
          },
          {
            "identity": "w5",
            "map": "infrastructure.structure"
          }
        ]
      },
      {
        "path": "Bundle.type",
        "short": "document | message | transaction | transaction-response | batch | batch-response | history | searchset | collection",
        "definition": "Indicates the purpose of this bundle- how it was intended to be used.",
        "comments": "It's possible to use a bundle for other purposes (e.g. a document can be accepted as a transaction). This is primarily defined so that there can be specific rules for some of the bundle types.",
        "min": 1,
        "max": "1",
        "type": [
          {
            "code": "code"
          }
        ],
        "isSummary": true,
        "binding": {
          "strength": "required",
          "description": "Indicates the purpose of a bundle - how it was intended to be used.",
          "valueSetReference": {
            "reference": "http://hl7.org/fhir/ValueSet/bundle-type"
          }
        },
        "mapping": [
          {
            "identity": "w5",
            "map": "class"
          }
        ]
      },
      {
        "path": "Bundle.total",
        "short": "If search, the total number of matches",
        "definition": "If a set of search matches, this is the total number of matches for the search (as opposed to the number of results in this bundle).",
        "comments": "Only used if the bundle is a search result set.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "unsignedInt"
          }
        ],
        "condition": [
          "bdl-1"
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.link",
        "name": "link",
        "short": "Links related to this Bundle",
        "definition": "A series of links that provide context to this bundle.",
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "BackboneElement"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.link.relation",
        "short": "http://www.iana.org/assignments/link-relations/link-relations.xhtml",
        "definition": "A name which details the functional use for this link - see http://www.iana.org/assignments/link-relations/link-relations.xhtml.",
        "min": 1,
        "max": "1",
        "type": [
          {
            "code": "string"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.link.url",
        "short": "Reference details for the link",
        "definition": "The reference details for the link.",
        "min": 1,
        "max": "1",
        "type": [
          {
            "code": "uri"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry",
        "short": "Entry in the bundle - will have a resource, or information",
        "definition": "An entry in a bundle resource - will either contain a resource, or information about a resource (transactions and history only).",
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "BackboneElement"
          }
        ],
        "constraint": [
          {
            "key": "bdl-5",
            "severity": "error",
            "human": "must be a resource unless there's a request or response",
            "xpath": "f:resource or f:request or f:response"
          },
          {
            "key": "bdl-6",
            "severity": "error",
            "human": "The fullUrl element must be present when a resource is present, and not present otherwise",
            "xpath": "(not(exists(f:fullUrl)) and not(exists(f:resource))) or (exists(f:fullUrl) and exists(f:resource))"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.link",
        "short": "Links related to this entry",
        "definition": "A series of links that provide context to this entry.",
        "min": 0,
        "max": "*",
        "type": [
          {
            "code": "BackboneElement"
          }
        ],
        "nameReference": "link",
        "isSummary": true
      },
      {
        "path": "Bundle.entry.fullUrl",
        "short": "Absolute URL for resource (server address, or UUID/OID)",
        "definition": "The Absolute URL for the resource. This must be provided for all resources. The fullUrl SHALL not disagree with the id in the resource. The fullUrl is a version independent reference to the resource.",
        "comments": "fullUrl may not be [unique in the context of a resource](bundle.html#bundle-unique). Note that since [FHIR resources do not need to be served through the FHIR API](references.html), the absolute URL may not end with the logical id of the resource (Resource.id), but if the fullUrl does look like a RESTful server URL (e.g. meets the [regex](references.html#regex), then it SHALL end with the Resource.id.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "uri"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.resource",
        "short": "A resource in the bundle",
        "definition": "The Resources for the entry.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "Resource"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.search",
        "short": "Search related information",
        "definition": "Information about the search process that lead to the creation of this entry.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "BackboneElement"
          }
        ],
        "condition": [
          "bdl-2"
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.search.mode",
        "short": "match | include | outcome - why this is in the result set",
        "definition": "Why this entry is in the result set - whether it's included as a match or because of an _include requirement.",
        "comments": "There is only one mode. In some corner cases, a resource may be included because it is both a match and an include. In these circumstances, 'match' takes precedence.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "code"
          }
        ],
        "isSummary": true,
        "binding": {
          "strength": "required",
          "description": "Why an entry is in the result set - whether it's included as a match or because of an _include requirement.",
          "valueSetReference": {
            "reference": "http://hl7.org/fhir/ValueSet/search-entry-mode"
          }
        }
      },
      {
        "path": "Bundle.entry.search.score",
        "short": "Search ranking (between 0 and 1)",
        "definition": "When searching, the server's search ranking score for the entry.",
        "comments": "Servers are not required to return a ranking score. 1 is most relevant, and 0 is least relevant. Often, search results are sorted by score, but the client may specify a different sort order.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "decimal"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.request",
        "short": "Transaction Related Information",
        "definition": "Additional information about how this entry should be processed as part of a transaction.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "BackboneElement"
          }
        ],
        "condition": [
          "bdl-3"
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.request.method",
        "short": "GET | POST | PUT | DELETE",
        "definition": "The HTTP verb for this entry in either a update history, or a transaction/ transaction response.",
        "min": 1,
        "max": "1",
        "type": [
          {
            "code": "code"
          }
        ],
        "isSummary": true,
        "binding": {
          "strength": "required",
          "description": "HTTP verbs (in the HTTP command line).",
          "valueSetReference": {
            "reference": "http://hl7.org/fhir/ValueSet/http-verb"
          }
        }
      },
      {
        "path": "Bundle.entry.request.url",
        "short": "URL for HTTP equivalent of this entry",
        "definition": "The URL for this entry, relative to the root (the address to which the request is posted).",
        "comments": "E.g. for a Patient Create, the method would be \"POST\" and the URL would be \"Patient\". For a Patient Update, the method would be PUT, and the URL would be \"Patient/[id]\".",
        "min": 1,
        "max": "1",
        "type": [
          {
            "code": "uri"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.request.ifNoneMatch",
        "short": "For managing cache currency",
        "definition": "If the ETag values match, return a 304 Not modified status. See the API documentation for [\"Conditional Read\"](http.html#cread).",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "string"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.request.ifModifiedSince",
        "short": "For managing update contention",
        "definition": "Only perform the operation if the last updated date matches. See the API documentation for [\"Conditional Read\"](http.html#cread).",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "instant"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.request.ifMatch",
        "short": "For managing update contention",
        "definition": "Only perform the operation if the Etag value matches. For more information, see the API section [\"Managing Resource Contention\"](http.html#concurrency).",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "string"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.request.ifNoneExist",
        "short": "For conditional creates",
        "definition": "Instruct the server not to perform the create if a specified resource already exists. For further information, see the API documentation for [\"Conditional Create\"](http.html#ccreate). This is just the query portion of the URL - what follows the \"?\" (not including the \"?\").",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "string"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.response",
        "short": "Transaction Related Information",
        "definition": "Additional information about how this entry should be processed as part of a transaction.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "BackboneElement"
          }
        ],
        "condition": [
          "bdl-4"
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.response.status",
        "short": "Status return code for entry",
        "definition": "The status code returned by processing this entry.",
        "min": 1,
        "max": "1",
        "type": [
          {
            "code": "string"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.response.location",
        "short": "The location, if the operation returns a location",
        "definition": "The location header created by processing this operation.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "uri"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.response.etag",
        "short": "The etag for the resource (if relevant)",
        "definition": "The etag for the resource, it the operation for the entry produced a versioned resource.",
        "comments": "This has to match the version id in the header if a resource is included.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "string"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.entry.response.lastModified",
        "short": "Server's date time modified",
        "definition": "The date/time that the resource was modified on the server.",
        "comments": "This has to match the same time in the meta header if a resource is included.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "instant"
          }
        ],
        "isSummary": true
      },
      {
        "path": "Bundle.signature",
        "short": "Digital Signature",
        "definition": "Digital Signature - base64 encoded. XML DigSIg or a JWT.",
        "comments": "The signature could be created by the \"author\" of the bundle or by the originating device.   Requirements around inclusion of a signature, verification of signatures and treatment of signed/non-signed bundles is implementation-environment specific.",
        "requirements": "This element allows capturing signatures on documents. It also allows signatures on messages, transactions or even query responses. It may support content-authentication, non-repudiation or other business cases. This is primarily relevant where the bundle may travel through multiple hops or via other mechanisms where HTTPS non-repudiation is insufficient.",
        "min": 0,
        "max": "1",
        "type": [
          {
            "code": "Signature"
          }
        ],
        "isSummary": true
      }
    ]
  }
}
]]

Bundle.xml = 
[[
<StructureDefinition xmlns="http://hl7.org/fhir">
  <id value="Bundle"/>
  <meta>
    <lastUpdated value="2015-10-24T07:41:03.495+11:00"/>
  </meta>
  <extension url="http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm">
    <valueInteger value="2"/>
  </extension>
  <url value="http://hl7.org/fhir/StructureDefinition/Bundle"/>
  <name value="Bundle"/>
  <status value="draft"/>
  <publisher value="Health Level Seven International (FHIR Infrastructure)"/>
  <contact>
    <telecom>
      <system value="other"/>
      <value value="http://hl7.org/fhir"/>
    </telecom>
  </contact>
  <contact>
    <telecom>
      <system value="other"/>
      <value value="http://www.hl7.org/Special/committees/fiwg/index.cfm"/>
    </telecom>
  </contact>
  <date value="2015-10-24T07:41:03+11:00"/>
  <description value="Base StructureDefinition for Bundle Resource"/>
  <fhirVersion value="1.0.2"/>
  <mapping>
    <identity value="v2"/>
    <uri value="http://hl7.org/v2"/>
    <name value="HL7 v2"/>
  </mapping>
  <mapping>
    <identity value="rim"/>
    <uri value="http://hl7.org/v3"/>
    <name value="RIM"/>
  </mapping>
  <mapping>
    <identity value="w5"/>
    <uri value="http://hl7.org/fhir/w5"/>
    <name value="W5 Mapping"/>
  </mapping>
  <kind value="resource"/>
  <abstract value="false"/>
  <base value="http://hl7.org/fhir/StructureDefinition/Resource"/>
  <snapshot>
    <element>
      <path value="Bundle"/>
      <short value="Contains a collection of resources"/>
      <definition value="A container for a collection of resources."/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="Resource"/>
      </type>
      <constraint>
        <key value="bdl-2"/>
        <severity value="error"/>
        <human value="entry.search only when a search"/>
        <xpath value="not(f:entry/f:search) or (f:type/@value = 'searchset')"/>
      </constraint>
      <constraint>
        <key value="bdl-1"/>
        <severity value="error"/>
        <human value="total only when a search or history"/>
        <xpath value="not(f:total) or (f:type/@value = 'searchset') or (f:type/@value = 'history')"/>
      </constraint>
      <constraint>
        <key value="bdl-7"/>
        <severity value="error"/>
        <human value="FullUrl must be unique in a bundle, or else entries with the same fullUrl must have different
         meta.versionId"/>
        <xpath value="count(for $entry in f:entry[f:resource] return $entry[count(parent::f:Bundle/f:entry[f:fullUrl/@valu
        e=$entry/f:fullUrl/@value and ((not(f:resource/*/f:meta/f:versionId/@value) and not($entry/f:resource
        /*/f:meta/f:versionId/@value)) or f:resource/*/f:meta/f:versionId/@value=$entry/f:resource/*/f:meta/f
        :versionId/@value)])!=1])=0"/>
      </constraint>
      <constraint>
        <key value="bdl-3"/>
        <severity value="error"/>
        <human value="entry.request only for some types of bundles"/>
        <xpath value="not(f:entry/f:request) or (f:type/@value = 'batch') or (f:type/@value = 'transaction')
         or (f:type/@value = 'history')"/>
      </constraint>
      <constraint>
        <key value="bdl-4"/>
        <severity value="error"/>
        <human value="entry.response only for some types of bundles"/>
        <xpath value="not(f:entry/f:response) or (f:type/@value = 'batch-response') or (f:type/@value = 'transaction-respo
        nse')"/>
      </constraint>
      <isSummary value="true"/>
      <mapping>
        <identity value="v2"/>
        <map value="N/A"/>
      </mapping>
      <mapping>
        <identity value="rim"/>
        <map value="N/A"/>
      </mapping>
      <mapping>
        <identity value="w5"/>
        <map value="infrastructure.structure"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.id"/>
      <short value="Logical id of this artifact"/>
      <definition value="The logical id of the resource, as used in the URL for the resource. Once assigned, this
       value never changes."/>
      <comments value="The only time that a resource does not have an id is when it is being submitted to the
       server using a create operation. Bundles always have an id, though it is usually a generated
       UUID."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="id"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.meta"/>
      <short value="Metadata about the resource"/>
      <definition value="The metadata about the resource. This is content that is maintained by the infrastructure.
       Changes to the content may not always be associated with version changes to the resource."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="Meta"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.implicitRules"/>
      <short value="A set of rules under which this content was created"/>
      <definition value="A reference to a set of rules that were followed when the resource was constructed, and
       which must be understood when processing the content."/>
      <comments value="Asserting this rule set restricts the content to be only understood by a limited set of
       trading partners. This inherently limits the usefulness of the data in the long term.
       However, the existing health eco-system is highly fractured, and not yet ready to define,
       collect, and exchange data in a generally computable sense. Wherever possible, implementers
       and/or specification writers should avoid using this element as much as possible."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="uri"/>
      </type>
      <isModifier value="true"/>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.language"/>
      <short value="Language of the resource content"/>
      <definition value="The base language in which the resource is written."/>
      <comments value="Language is provided to support indexing and accessibility (typically, services such as
       text to speech use the language tag). The html language tag in the narrative applies 
       to the narrative. The language tag on the resource may be used to specify the language
       of other presentations generated from the data in the resource  Not all the content has
       to be in the base language. The Resource.language should not be assumed to apply to the
       narrative automatically. If a language is specified, it should it also be specified on
       the div element in the html (see rules in HTML5 for information about the relationship
       between xml:lang and the html lang attribute)."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="code"/>
      </type>
      <binding>
        <strength value="required"/>
        <description value="A human language."/>
        <valueSetUri value="http://tools.ietf.org/html/bcp47"/>
      </binding>
    </element>
    <element>
      <path value="Bundle.type"/>
      <short value="document | message | transaction | transaction-response | batch | batch-response | history
       | searchset | collection"/>
      <definition value="Indicates the purpose of this bundle- how it was intended to be used."/>
      <comments value="It's possible to use a bundle for other purposes (e.g. a document can be accepted as a
       transaction). This is primarily defined so that there can be specific rules for some of
       the bundle types."/>
      <min value="1"/>
      <max value="1"/>
      <type>
        <code value="code"/>
      </type>
      <isSummary value="true"/>
      <binding>
        <strength value="required"/>
        <description value="Indicates the purpose of a bundle - how it was intended to be used."/>
        <valueSetReference>
          <reference value="http://hl7.org/fhir/ValueSet/bundle-type"/>
        </valueSetReference>
      </binding>
      <mapping>
        <identity value="w5"/>
        <map value="class"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.total"/>
      <short value="If search, the total number of matches"/>
      <definition value="If a set of search matches, this is the total number of matches for the search (as opposed
       to the number of results in this bundle)."/>
      <comments value="Only used if the bundle is a search result set."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="unsignedInt"/>
      </type>
      <condition value="bdl-1"/>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.link"/>
      <name value="link"/>
      <short value="Links related to this Bundle"/>
      <definition value="A series of links that provide context to this bundle."/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="BackboneElement"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.link.id"/>
      <representation value="xmlAttr"/>
      <short value="xml:id (or equivalent in JSON)"/>
      <definition value="unique id for the element within a resource (for internal references)."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="id"/>
      </type>
      <mapping>
        <identity value="rim"/>
        <map value="n/a"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.link.extension"/>
      <short value="Additional Content defined by implementations"/>
      <definition value="May be used to represent additional information that is not part of the basic definition
       of the element. In order to make the use of extensions safe and manageable, there is a
       strict set of governance  applied to the definition and use of extensions. Though any
       implementer is allowed to define an extension, there is a set of requirements that SHALL
       be met as part of the definition of the extension."/>
      <comments value="There can be no stigma associated with the use of extensions by any application, project,
       or standard - regardless of the institution or jurisdiction that uses or defines the extensions.
        The use of extensions is what allows the FHIR specification to retain a core level of
       simplicity for everyone."/>
      <alias value="extensions"/>
      <alias value="user content"/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="Extension"/>
      </type>
      <mapping>
        <identity value="rim"/>
        <map value="n/a"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.link.modifierExtension"/>
      <short value="Extensions that cannot be ignored"/>
      <definition value="May be used to represent additional information that is not part of the basic definition
       of the element, and that modifies the understanding of the element that contains it. Usually
       modifier elements provide negation or qualification. In order to make the use of extensions
       safe and manageable, there is a strict set of governance applied to the definition and
       use of extensions. Though any implementer is allowed to define an extension, there is
       a set of requirements that SHALL be met as part of the definition of the extension. Applications
       processing a resource are required to check for modifier extensions."/>
      <comments value="There can be no stigma associated with the use of extensions by any application, project,
       or standard - regardless of the institution or jurisdiction that uses or defines the extensions.
        The use of extensions is what allows the FHIR specification to retain a core level of
       simplicity for everyone."/>
      <alias value="extensions"/>
      <alias value="user content"/>
      <alias value="modifiers"/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="Extension"/>
      </type>
      <isModifier value="true"/>
      <mapping>
        <identity value="rim"/>
        <map value="N/A"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.link.relation"/>
      <short value="http://www.iana.org/assignments/link-relations/link-relations.xhtml"/>
      <definition value="A name which details the functional use for this link - see http://www.iana.org/assignments/link-relations/link-relations.xhtml."/>
      <min value="1"/>
      <max value="1"/>
      <type>
        <code value="string"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.link.url"/>
      <short value="Reference details for the link"/>
      <definition value="The reference details for the link."/>
      <min value="1"/>
      <max value="1"/>
      <type>
        <code value="uri"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry"/>
      <short value="Entry in the bundle - will have a resource, or information"/>
      <definition value="An entry in a bundle resource - will either contain a resource, or information about a
       resource (transactions and history only)."/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="BackboneElement"/>
      </type>
      <constraint>
        <key value="bdl-5"/>
        <severity value="error"/>
        <human value="must be a resource unless there's a request or response"/>
        <xpath value="f:resource or f:request or f:response"/>
      </constraint>
      <constraint>
        <key value="bdl-6"/>
        <severity value="error"/>
        <human value="The fullUrl element must be present when a resource is present, and not present otherwise"/>
        <xpath value="(not(exists(f:fullUrl)) and not(exists(f:resource))) or (exists(f:fullUrl) and exists(f:resource))"/>
      </constraint>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.id"/>
      <representation value="xmlAttr"/>
      <short value="xml:id (or equivalent in JSON)"/>
      <definition value="unique id for the element within a resource (for internal references)."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="id"/>
      </type>
      <mapping>
        <identity value="rim"/>
        <map value="n/a"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.entry.extension"/>
      <short value="Additional Content defined by implementations"/>
      <definition value="May be used to represent additional information that is not part of the basic definition
       of the element. In order to make the use of extensions safe and manageable, there is a
       strict set of governance  applied to the definition and use of extensions. Though any
       implementer is allowed to define an extension, there is a set of requirements that SHALL
       be met as part of the definition of the extension."/>
      <comments value="There can be no stigma associated with the use of extensions by any application, project,
       or standard - regardless of the institution or jurisdiction that uses or defines the extensions.
        The use of extensions is what allows the FHIR specification to retain a core level of
       simplicity for everyone."/>
      <alias value="extensions"/>
      <alias value="user content"/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="Extension"/>
      </type>
      <mapping>
        <identity value="rim"/>
        <map value="n/a"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.entry.modifierExtension"/>
      <short value="Extensions that cannot be ignored"/>
      <definition value="May be used to represent additional information that is not part of the basic definition
       of the element, and that modifies the understanding of the element that contains it. Usually
       modifier elements provide negation or qualification. In order to make the use of extensions
       safe and manageable, there is a strict set of governance applied to the definition and
       use of extensions. Though any implementer is allowed to define an extension, there is
       a set of requirements that SHALL be met as part of the definition of the extension. Applications
       processing a resource are required to check for modifier extensions."/>
      <comments value="There can be no stigma associated with the use of extensions by any application, project,
       or standard - regardless of the institution or jurisdiction that uses or defines the extensions.
        The use of extensions is what allows the FHIR specification to retain a core level of
       simplicity for everyone."/>
      <alias value="extensions"/>
      <alias value="user content"/>
      <alias value="modifiers"/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="Extension"/>
      </type>
      <isModifier value="true"/>
      <mapping>
        <identity value="rim"/>
        <map value="N/A"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.entry.link"/>
      <short value="Links related to this entry"/>
      <definition value="A series of links that provide context to this entry."/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="BackboneElement"/>
      </type>
      <nameReference value="link"/>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.fullUrl"/>
      <short value="Absolute URL for resource (server address, or UUID/OID)"/>
      <definition value="The Absolute URL for the resource. This must be provided for all resources. The fullUrl
       SHALL not disagree with the id in the resource. The fullUrl is a version independent reference
       to the resource."/>
      <comments value="fullUrl may not be [unique in the context of a resource](bundle.html#bundle-unique). Note
       that since [FHIR resources do not need to be served through the FHIR API](references.html),
       the absolute URL may not end with the logical id of the resource (Resource.id), but if
       the fullUrl does look like a RESTful server URL (e.g. meets the [regex](references.html#regex),
       then it SHALL end with the Resource.id."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="uri"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.resource"/>
      <short value="A resource in the bundle"/>
      <definition value="The Resources for the entry."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="Resource"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.search"/>
      <short value="Search related information"/>
      <definition value="Information about the search process that lead to the creation of this entry."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="BackboneElement"/>
      </type>
      <condition value="bdl-2"/>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.search.id"/>
      <representation value="xmlAttr"/>
      <short value="xml:id (or equivalent in JSON)"/>
      <definition value="unique id for the element within a resource (for internal references)."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="id"/>
      </type>
      <mapping>
        <identity value="rim"/>
        <map value="n/a"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.entry.search.extension"/>
      <short value="Additional Content defined by implementations"/>
      <definition value="May be used to represent additional information that is not part of the basic definition
       of the element. In order to make the use of extensions safe and manageable, there is a
       strict set of governance  applied to the definition and use of extensions. Though any
       implementer is allowed to define an extension, there is a set of requirements that SHALL
       be met as part of the definition of the extension."/>
      <comments value="There can be no stigma associated with the use of extensions by any application, project,
       or standard - regardless of the institution or jurisdiction that uses or defines the extensions.
        The use of extensions is what allows the FHIR specification to retain a core level of
       simplicity for everyone."/>
      <alias value="extensions"/>
      <alias value="user content"/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="Extension"/>
      </type>
      <mapping>
        <identity value="rim"/>
        <map value="n/a"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.entry.search.modifierExtension"/>
      <short value="Extensions that cannot be ignored"/>
      <definition value="May be used to represent additional information that is not part of the basic definition
       of the element, and that modifies the understanding of the element that contains it. Usually
       modifier elements provide negation or qualification. In order to make the use of extensions
       safe and manageable, there is a strict set of governance applied to the definition and
       use of extensions. Though any implementer is allowed to define an extension, there is
       a set of requirements that SHALL be met as part of the definition of the extension. Applications
       processing a resource are required to check for modifier extensions."/>
      <comments value="There can be no stigma associated with the use of extensions by any application, project,
       or standard - regardless of the institution or jurisdiction that uses or defines the extensions.
        The use of extensions is what allows the FHIR specification to retain a core level of
       simplicity for everyone."/>
      <alias value="extensions"/>
      <alias value="user content"/>
      <alias value="modifiers"/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="Extension"/>
      </type>
      <isModifier value="true"/>
      <mapping>
        <identity value="rim"/>
        <map value="N/A"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.entry.search.mode"/>
      <short value="match | include | outcome - why this is in the result set"/>
      <definition value="Why this entry is in the result set - whether it's included as a match or because of an
       _include requirement."/>
      <comments value="There is only one mode. In some corner cases, a resource may be included because it is
       both a match and an include. In these circumstances, 'match' takes precedence."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="code"/>
      </type>
      <isSummary value="true"/>
      <binding>
        <strength value="required"/>
        <description value="Why an entry is in the result set - whether it's included as a match or because of an
         _include requirement."/>
        <valueSetReference>
          <reference value="http://hl7.org/fhir/ValueSet/search-entry-mode"/>
        </valueSetReference>
      </binding>
    </element>
    <element>
      <path value="Bundle.entry.search.score"/>
      <short value="Search ranking (between 0 and 1)"/>
      <definition value="When searching, the server's search ranking score for the entry."/>
      <comments value="Servers are not required to return a ranking score. 1 is most relevant, and 0 is least
       relevant. Often, search results are sorted by score, but the client may specify a different
       sort order."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="decimal"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.request"/>
      <short value="Transaction Related Information"/>
      <definition value="Additional information about how this entry should be processed as part of a transaction."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="BackboneElement"/>
      </type>
      <condition value="bdl-3"/>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.request.id"/>
      <representation value="xmlAttr"/>
      <short value="xml:id (or equivalent in JSON)"/>
      <definition value="unique id for the element within a resource (for internal references)."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="id"/>
      </type>
      <mapping>
        <identity value="rim"/>
        <map value="n/a"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.entry.request.extension"/>
      <short value="Additional Content defined by implementations"/>
      <definition value="May be used to represent additional information that is not part of the basic definition
       of the element. In order to make the use of extensions safe and manageable, there is a
       strict set of governance  applied to the definition and use of extensions. Though any
       implementer is allowed to define an extension, there is a set of requirements that SHALL
       be met as part of the definition of the extension."/>
      <comments value="There can be no stigma associated with the use of extensions by any application, project,
       or standard - regardless of the institution or jurisdiction that uses or defines the extensions.
        The use of extensions is what allows the FHIR specification to retain a core level of
       simplicity for everyone."/>
      <alias value="extensions"/>
      <alias value="user content"/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="Extension"/>
      </type>
      <mapping>
        <identity value="rim"/>
        <map value="n/a"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.entry.request.modifierExtension"/>
      <short value="Extensions that cannot be ignored"/>
      <definition value="May be used to represent additional information that is not part of the basic definition
       of the element, and that modifies the understanding of the element that contains it. Usually
       modifier elements provide negation or qualification. In order to make the use of extensions
       safe and manageable, there is a strict set of governance applied to the definition and
       use of extensions. Though any implementer is allowed to define an extension, there is
       a set of requirements that SHALL be met as part of the definition of the extension. Applications
       processing a resource are required to check for modifier extensions."/>
      <comments value="There can be no stigma associated with the use of extensions by any application, project,
       or standard - regardless of the institution or jurisdiction that uses or defines the extensions.
        The use of extensions is what allows the FHIR specification to retain a core level of
       simplicity for everyone."/>
      <alias value="extensions"/>
      <alias value="user content"/>
      <alias value="modifiers"/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="Extension"/>
      </type>
      <isModifier value="true"/>
      <mapping>
        <identity value="rim"/>
        <map value="N/A"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.entry.request.method"/>
      <short value="GET | POST | PUT | DELETE"/>
      <definition value="The HTTP verb for this entry in either a update history, or a transaction/ transaction
       response."/>
      <min value="1"/>
      <max value="1"/>
      <type>
        <code value="code"/>
      </type>
      <isSummary value="true"/>
      <binding>
        <strength value="required"/>
        <description value="HTTP verbs (in the HTTP command line)."/>
        <valueSetReference>
          <reference value="http://hl7.org/fhir/ValueSet/http-verb"/>
        </valueSetReference>
      </binding>
    </element>
    <element>
      <path value="Bundle.entry.request.url"/>
      <short value="URL for HTTP equivalent of this entry"/>
      <definition value="The URL for this entry, relative to the root (the address to which the request is posted)."/>
      <comments value="E.g. for a Patient Create, the method would be &quot;POST&quot; and the URL would be &quot;Patient&quot;. For a Patient Update, the would be PUT, and the URL would be &quot;Patient/[id]&quot;."/>
      <min value="1"/>
      <max value="1"/>
      <type>
        <code value="uri"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.request.ifNoneMatch"/>
      <short value="For managing cache currency"/>
      <definition value="If the ETag values match, return a 304 Not modified status. See the API documentation
       for [&quot;Conditional Read&quot;](http.html#cread)."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="string"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.request.ifModifiedSince"/>
      <short value="For managing update contention"/>
      <definition value="Only perform the operation if the last updated date matches. See the API documentation
       for [&quot;Conditional Read&quot;](http.html#cread)."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="instant"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.request.ifMatch"/>
      <short value="For managing update contention"/>
      <definition value="Only perform the operation if the Etag value matches. For more information, see the API
       section [&quot;Managing Resource Contention&quot;](http.html#concurrency)."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="string"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.request.ifNoneExist"/>
      <short value="For conditional creates"/>
      <definition value="Instruct the server not to perform the create if a specified resource already exists.
       For further information, see the API documentation for [&quot;Conditional Create&quot;](http.html#cc
      reate). This is just the query portion of the URL - what follows the &quot;?&quot; (not
       including the &quot;?&quot;)."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="string"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.response"/>
      <short value="Transaction Related Information"/>
      <definition value="Additional information about how this entry should be processed as part of a transaction."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="BackboneElement"/>
      </type>
      <condition value="bdl-4"/>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.response.id"/>
      <representation value="xmlAttr"/>
      <short value="xml:id (or equivalent in JSON)"/>
      <definition value="unique id for the element within a resource (for internal references)."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="id"/>
      </type>
      <mapping>
        <identity value="rim"/>
        <map value="n/a"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.entry.response.extension"/>
      <short value="Additional Content defined by implementations"/>
      <definition value="May be used to represent additional information that is not part of the basic definition
       of the element. In order to make the use of extensions safe and manageable, there is a
       strict set of governance  applied to the definition and use of extensions. Though any
       implementer is allowed to define an extension, there is a set of requirements that SHALL
       be met as part of the definition of the extension."/>
      <comments value="There can be no stigma associated with the use of extensions by any application, project,
       or standard - regardless of the institution or jurisdiction that uses or defines the extensions.
        The use of extensions is what allows the FHIR specification to retain a core level of
       simplicity for everyone."/>
      <alias value="extensions"/>
      <alias value="user content"/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="Extension"/>
      </type>
      <mapping>
        <identity value="rim"/>
        <map value="n/a"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.entry.response.modifierExtension"/>
      <short value="Extensions that cannot be ignored"/>
      <definition value="May be used to represent additional information that is not part of the basic definition
       of the element, and that modifies the understanding of the element that contains it. Usually
       modifier elements provide negation or qualification. In order to make the use of extensions
       safe and manageable, there is a strict set of governance applied to the definition and
       use of extensions. Though any implementer is allowed to define an extension, there is
       a set of requirements that SHALL be met as part of the definition of the extension. Applications
       processing a resource are required to check for modifier extensions."/>
      <comments value="There can be no stigma associated with the use of extensions by any application, project,
       or standard - regardless of the institution or jurisdiction that uses or defines the extensions.
        The use of extensions is what allows the FHIR specification to retain a core level of
       simplicity for everyone."/>
      <alias value="extensions"/>
      <alias value="user content"/>
      <alias value="modifiers"/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="Extension"/>
      </type>
      <isModifier value="true"/>
      <mapping>
        <identity value="rim"/>
        <map value="N/A"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.entry.response.status"/>
      <short value="Status return code for entry"/>
      <definition value="The status code returned by processing this entry."/>
      <min value="1"/>
      <max value="1"/>
      <type>
        <code value="string"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.response.location"/>
      <short value="The location, if the operation returns a location"/>
      <definition value="The location header created by processing this operation."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="uri"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.response.etag"/>
      <short value="The etag for the resource (if relevant)"/>
      <definition value="The etag for the resource, it the operation for the entry produced a versioned resource."/>
      <comments value="This has to match the version id in the header if a resource is included."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="string"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.response.lastModified"/>
      <short value="Server's date time modified"/>
      <definition value="The date/time that the resource was modified on the server."/>
      <comments value="This has to match the same time in the meta header if a resource is included."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="instant"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.signature"/>
      <short value="Digital Signature"/>
      <definition value="Digital Signature - base64 encoded. XML DigSIg or a JWT."/>
      <comments value="The signature could be created by the &quot;author&quot; of the bundle or by the originating
       device.   Requirements around inclusion of a signature, verification of signatures and
       treatment of signed/non-signed bundles is implementation-environment specific."/>
      <requirements value="This element allows capturing signatures on documents. It also allows signatures on messages,
       transactions or even query responses. It may support content-authentication, non-repudiation
       or other business cases. This is primarily relevant where the bundle may travel through
       multiple hops or via other mechanisms where HTTPS non-repudiation is insufficient."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="Signature"/>
      </type>
      <isSummary value="true"/>
    </element>
  </snapshot>
  <differential>
    <element>
      <path value="Bundle"/>
      <short value="Contains a collection of resources"/>
      <definition value="A container for a collection of resources."/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="Resource"/>
      </type>
      <constraint>
        <key value="bdl-2"/>
        <severity value="error"/>
        <human value="entry.search only when a search"/>
        <xpath value="not(f:entry/f:search) or (f:type/@value = 'searchset')"/>
      </constraint>
      <constraint>
        <key value="bdl-1"/>
        <severity value="error"/>
        <human value="total only when a search or history"/>
        <xpath value="not(f:total) or (f:type/@value = 'searchset') or (f:type/@value = 'history')"/>
      </constraint>
      <constraint>
        <key value="bdl-7"/>
        <severity value="error"/>
        <human value="FullUrl must be unique in a bundle, or else entries with the same fullUrl must have different
         meta.versionId"/>
        <xpath value="count(for $entry in f:entry[f:resource] return $entry[count(parent::f:Bundle/f:entry[f:fullUrl/@valu
        e=$entry/f:fullUrl/@value and ((not(f:resource/*/f:meta/f:versionId/@value) and not($entry/f:resource
        /*/f:meta/f:versionId/@value)) or f:resource/*/f:meta/f:versionId/@value=$entry/f:resource/*/f:meta/f
        :versionId/@value)])!=1])=0"/>
      </constraint>
      <constraint>
        <key value="bdl-3"/>
        <severity value="error"/>
        <human value="entry.request only for some types of bundles"/>
        <xpath value="not(f:entry/f:request) or (f:type/@value = 'batch') or (f:type/@value = 'transaction')
         or (f:type/@value = 'history')"/>
      </constraint>
      <constraint>
        <key value="bdl-4"/>
        <severity value="error"/>
        <human value="entry.response only for some types of bundles"/>
        <xpath value="not(f:entry/f:response) or (f:type/@value = 'batch-response') or (f:type/@value = 'transaction-respo
        nse')"/>
      </constraint>
      <isSummary value="true"/>
      <mapping>
        <identity value="v2"/>
        <map value="N/A"/>
      </mapping>
      <mapping>
        <identity value="rim"/>
        <map value="N/A"/>
      </mapping>
      <mapping>
        <identity value="w5"/>
        <map value="infrastructure.structure"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.type"/>
      <short value="document | message | transaction | transaction-response | batch | batch-response | history
       | searchset | collection"/>
      <definition value="Indicates the purpose of this bundle- how it was intended to be used."/>
      <comments value="It's possible to use a bundle for other purposes (e.g. a document can be accepted as a
       transaction). This is primarily defined so that there can be specific rules for some of
       the bundle types."/>
      <min value="1"/>
      <max value="1"/>
      <type>
        <code value="code"/>
      </type>
      <isSummary value="true"/>
      <binding>
        <strength value="required"/>
        <description value="Indicates the purpose of a bundle - how it was intended to be used."/>
        <valueSetReference>
          <reference value="http://hl7.org/fhir/ValueSet/bundle-type"/>
        </valueSetReference>
      </binding>
      <mapping>
        <identity value="w5"/>
        <map value="class"/>
      </mapping>
    </element>
    <element>
      <path value="Bundle.total"/>
      <short value="If search, the total number of matches"/>
      <definition value="If a set of search matches, this is the total number of matches for the search (as opposed
       to the number of results in this bundle)."/>
      <comments value="Only used if the bundle is a search result set."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="unsignedInt"/>
      </type>
      <condition value="bdl-1"/>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.link"/>
      <name value="link"/>
      <short value="Links related to this Bundle"/>
      <definition value="A series of links that provide context to this bundle."/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="BackboneElement"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.link.relation"/>
      <short value="http://www.iana.org/assignments/link-relations/link-relations.xhtml"/>
      <definition value="A name which details the functional use for this link - see http://www.iana.org/assignments/link-relations/link-relations.xhtml."/>
      <min value="1"/>
      <max value="1"/>
      <type>
        <code value="string"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.link.url"/>
      <short value="Reference details for the link"/>
      <definition value="The reference details for the link."/>
      <min value="1"/>
      <max value="1"/>
      <type>
        <code value="uri"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry"/>
      <short value="Entry in the bundle - will have a resource, or information"/>
      <definition value="An entry in a bundle resource - will either contain a resource, or information about a
       resource (transactions and history only)."/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="BackboneElement"/>
      </type>
      <constraint>
        <key value="bdl-5"/>
        <severity value="error"/>
        <human value="must be a resource unless there's a request or response"/>
        <xpath value="f:resource or f:request or f:response"/>
      </constraint>
      <constraint>
        <key value="bdl-6"/>
        <severity value="error"/>
        <human value="The fullUrl element must be present when a resource is present, and not present otherwise"/>
        <xpath value="(not(exists(f:fullUrl)) and not(exists(f:resource))) or (exists(f:fullUrl) and exists(f:resource))"/>
      </constraint>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.link"/>
      <short value="Links related to this entry"/>
      <definition value="A series of links that provide context to this entry."/>
      <min value="0"/>
      <max value="*"/>
      <type>
        <code value="BackboneElement"/>
      </type>
      <nameReference value="link"/>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.fullUrl"/>
      <short value="Absolute URL for resource (server address, or UUID/OID)"/>
      <definition value="The Absolute URL for the resource. This must be provided for all resources. The fullUrl
       SHALL not disagree with the id in the resource. The fullUrl is a version independent reference
       to the resource."/>
      <comments value="fullUrl may not be [unique in the context of a resource](bundle.html#bundle-unique). Note
       that since [FHIR resources do not need to be served through the FHIR API](references.html),
       the absolute URL may not end with the logical id of the resource (Resource.id), but if
       the fullUrl does look like a RESTful server URL (e.g. meets the [regex](references.html#regex),
       then it SHALL end with the Resource.id."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="uri"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.resource"/>
      <short value="A resource in the bundle"/>
      <definition value="The Resources for the entry."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="Resource"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.search"/>
      <short value="Search related information"/>
      <definition value="Information about the search process that lead to the creation of this entry."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="BackboneElement"/>
      </type>
      <condition value="bdl-2"/>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.search.mode"/>
      <short value="match | include | outcome - why this is in the result set"/>
      <definition value="Why this entry is in the result set - whether it's included as a match or because of an
       _include requirement."/>
      <comments value="There is only one mode. In some corner cases, a resource may be included because it is
       both a match and an include. In these circumstances, 'match' takes precedence."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="code"/>
      </type>
      <isSummary value="true"/>
      <binding>
        <strength value="required"/>
        <description value="Why an entry is in the result set - whether it's included as a match or because of an
         _include requirement."/>
        <valueSetReference>
          <reference value="http://hl7.org/fhir/ValueSet/search-entry-mode"/>
        </valueSetReference>
      </binding>
    </element>
    <element>
      <path value="Bundle.entry.search.score"/>
      <short value="Search ranking (between 0 and 1)"/>
      <definition value="When searching, the server's search ranking score for the entry."/>
      <comments value="Servers are not required to return a ranking score. 1 is most relevant, and 0 is least
       relevant. Often, search results are sorted by score, but the client may specify a different
       sort order."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="decimal"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.request"/>
      <short value="Transaction Related Information"/>
      <definition value="Additional information about how this entry should be processed as part of a transaction."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="BackboneElement"/>
      </type>
      <condition value="bdl-3"/>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.request.method"/>
      <short value="GET | POST | PUT | DELETE"/>
      <definition value="The HTTP verb for this entry in either a update history, or a transaction/ transaction
       response."/>
      <min value="1"/>
      <max value="1"/>
      <type>
        <code value="code"/>
      </type>
      <isSummary value="true"/>
      <binding>
        <strength value="required"/>
        <description value="HTTP verbs (in the HTTP command line)."/>
        <valueSetReference>
          <reference value="http://hl7.org/fhir/ValueSet/http-verb"/>
        </valueSetReference>
      </binding>
    </element>
    <element>
      <path value="Bundle.entry.request.url"/>
      <short value="URL for HTTP equivalent of this entry"/>
      <definition value="The URL for this entry, relative to the root (the address to which the request is posted)."/>
      <comments value="E.g. for a Patient Create, the method would be &quot;POST&quot; and the URL would be &quot;Patient&quot;. For a Patient Update, the method would be PUT, and the URL would be &quot;Patient/[id]&quot;."/>
      <min value="1"/>
      <max value="1"/>
      <type>
        <code value="uri"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.request.ifNoneMatch"/>
      <short value="For managing cache currency"/>
      <definition value="If the ETag values match, return a 304 Not modified status. See the API documentation
       for [&quot;Conditional Read&quot;](http.html#cread)."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="string"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.request.ifModifiedSince"/>
      <short value="For managing update contention"/>
      <definition value="Only perform the operation if the last updated date matches. See the API documentation
       for [&quot;Conditional Read&quot;](http.html#cread)."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="instant"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.request.ifMatch"/>
      <short value="For managing update contention"/>
      <definition value="Only perform the operation if the Etag value matches. For more information, see the API
       section [&quot;Managing Resource Contention&quot;](http.html#concurrency)."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="string"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.request.ifNoneExist"/>
      <short value="For conditional creates"/>
      <definition value="Instruct the server not to perform the create if a specified resource already exists.
       For further information, see the API documentation for [&quot;Conditional Create&quot;](http.html#cc
      reate). This is just the query portion of the URL - what follows the &quot;?&quot; (not
       including the &quot;?&quot;)."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="string"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.response"/>
      <short value="Transaction Related Information"/>
      <definition value="Additional information about how this entry should be processed as part of a transaction."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="BackboneElement"/>
      </type>
      <condition value="bdl-4"/>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.response.status"/>
      <short value="Status return code for entry"/>
      <definition value="The status code returned by processing this entry."/>
      <min value="1"/>
      <max value="1"/>
      <type>
        <code value="string"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.response.location"/>
      <short value="The location, if the operation returns a location"/>
      <definition value="The location header created by processing this operation."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="uri"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.response.etag"/>
      <short value="The etag for the resource (if relevant)"/>
      <definition value="The etag for the resource, it the operation for the entry produced a versioned resource."/>
      <comments value="This has to match the version id in the header if a resource is included."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="string"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.entry.response.lastModified"/>
      <short value="Server's date time modified"/>
      <definition value="The date/time that the resource was modified on the server."/>
      <comments value="This has to match the same time in the meta header if a resource is included."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="instant"/>
      </type>
      <isSummary value="true"/>
    </element>
    <element>
      <path value="Bundle.signature"/>
      <short value="Digital Signature"/>
      <definition value="Digital Signature - base64 encoded. XML DigSIg or a JWT."/>
      <comments value="The signature could be created by the &quot;author&quot; of the bundle or by the originating
       device.   Requirements around inclusion of a signature, verification of signatures and
       treatment of signed/non-signed bundles is implementation-environment specific."/>
      <requirements value="This element allows capturing signatures on documents. It also allows signatures on messages,
       transactions or even query responses. It may support content-authentication, non-repudiation
       or other business cases. This is primarily relevant where the bundle may travel through
       multiple hops or via other mechanisms where HTTPS non-repudiation is insufficient."/>
      <min value="0"/>
      <max value="1"/>
      <type>
        <code value="Signature"/>
      </type>
      <isSummary value="true"/>
    </element>
  </differential>
</StructureDefinition>
]]



return Bundle