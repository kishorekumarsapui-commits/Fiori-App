using ProcessorService as service from '../../srv/service';
using from '../../db/schema';

annotate service.Incidents with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Customerid}',
                Value : customer_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'urgency_code',
                Value : urgency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status_code',
                Value : status_code,
            },
            {
                $Type : 'UI.DataField',
                Value : comments,
                Label : 'comments',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Overview',
            ID : 'Overview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Deatils',
                    ID : 'Deatils',
                    Target : '@UI.FieldGroup#Deatils',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Convesrions',
                    ID : 'Convesrions',
                    Target : 'conversation/@UI.LineItem#Convesrions',
                },
            ],
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Customerid}',
            Value : customer_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : status.descr,
            Label : '{i18n>Statuscode}',
            Criticality : status.criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : urgency.descr,
            Label : '{i18n>Urgencycode}',
            Criticality : status.criticality,
            CriticalityRepresentation : #WithIcon,
        },
    ],
    UI.SelectionFields : [
        title,
        ID,
        urgency_code,
        status_code,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : customer.name,
        },
        TypeImageUrl : 'sap-icon://alert',
    },
    UI.FieldGroup #Deatils : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
        ],
    },
);

annotate service.Incidents with {
    customer @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Customers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : customer_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'firstName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'lastName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'email',
                },
            ],
        },
        Common.Text : customer.name,
        Common.Text.@UI.TextArrangement : #TextOnly,
        Common.ValueListWithFixedValues : false,
    )
};

annotate service.Incidents with {
    ID @Common.Label : 'ID'
};

annotate service.Incidents with {
    urgency @(
        Common.Label : '{i18n>Urgencycode}',
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Incidents with {
    status @(
        Common.Label : '{i18n>Statuscode}',
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Urgency with {
    code @Common.Text : descr
};

annotate service.Status with {
    code @Common.Text : descr
};

annotate service.Incidents.conversation with @(
    UI.LineItem #Convesrions : [
        {
            $Type : 'UI.DataField',
            Value : up_.conversation.author,
        },
        {
            $Type : 'UI.DataField',
            Value : up_.conversation.ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : up_.conversation.message,
            Label : 'message',
        },
        {
            $Type : 'UI.DataField',
            Value : up_.conversation.timestamp,
        },
    ]
);

annotate service.Urgency with {
    descr @(
        UI.MultiLineText : true,
        )
};

