window.repositoryObject = {"parameters_custom_fields":[],"object_id":"p198","name":"updateRegisterStudent (Update Registered Student)","subtype":"PROCEDURE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"Examination System","id":"d4"}},{"field":"Schema","value":"dbo"},{"field":"Name","value":"updateRegisterStudent"},{"field":"Type","value":"Procedure"},{"field":"Title","value":"Update Registered Student"},{"field":"Status","value":{"value":"Active","type":"LIST_CLOSED","_type":"custom_field"}}],"script":null,"parameters":[{"name":"ALiasColumnName","description":"Desired Column Name to Update its value in a specific row ","mode":"IN","data_type":"varchar(30)","custom_fields":{}},{"name":"ColumnNewValue","description":"The new value assigned to the edited column ","mode":"IN","data_type":"varchar(50)","custom_fields":{}},{"name":"ConditionValue1","description":"The first part of the composite primary key related to the desired edited row (Student ID)","mode":"IN","data_type":"varchar(20)","custom_fields":{}},{"name":"ConditionValue2","description":"The second part of the composite primary key related to the desired edited row  (Register ID)","mode":"IN","data_type":"varchar(20)","custom_fields":{}}],"dependencies":{"uses":[{"object_name":"updateRegisterStudent (Update Registered Student)","object_name_show_schema":"dbo.updateRegisterStudent (Update Registered Student)","object_type":"PROCEDURE","object_id":"p198","type":"NORMAL","object_user_defined":false,"user_defined":false,"children":[{"object_name":"Regis_Stud (Registrar & Student)","object_name_show_schema":"dbo.Regis_Stud (Registrar & Student)","object_type":"TABLE","object_id":"t3705","type":"NORMAL","object_user_defined":false,"user_defined":true,"children":[]}]}],"used_by":[]},"imported_at":"2021-01-19 18:45"};