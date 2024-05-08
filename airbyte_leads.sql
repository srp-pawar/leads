{"Age": "string", "Name": "string", "Email": "string", "Comments": "string", "Location": "string", "Phone Number": "string", "Campaign Name": "string",  "Advertisement Name": "string", "Advertisement Source": "string"}
=================================

    sudo -u postgres psql
    
=================================
    
    \dn   ==> list of schema 

=================================

    \c default ==> use database
    
=================================

    \dt ==> list of tables 
    
=================================

CREATE  OR REPLACE FUNCTION insert_into_workspace_1wgvd1injqtife6y4rvfbu3h5_lead_function()
RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO "workspace_1wgvd1injqtife6y4rvfbu3h5"."_lead" ("name", "age", "email","comments","location","phoneNumber","campaignName","advertisementName","advertisementSource","gender")
    VALUES (NEW."Name", NEW."Age", NEW."Email",NEW."Comments",NEW."Location",NEW."Phone_Number",NEW."Campaign_Name",NEW."Advertisement_Name",NEW."Advertisement_Source",NEW."Gender");
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;



=================================


CREATE TRIGGER insert_into_workspace_1wgvd1injqtife6y4rvfbu3h5_lead
AFTER INSERT ON "Leads"."leads" 
FOR EACH ROW
EXECUTE FUNCTION insert_into_workspace_1wgvd1injqtife6y4rvfbu3h5_lead_function();



=================================


DROP TRIGGER IF EXISTS insert_into_workspace_1wgvd1injqtife6y4rvfbu3h5_lead ON "Leads"."leads" ;
DROP FUNCTION IF EXISTS insert_into_workspace_1wgvd1injqtife6y4rvfbu3h5_lead_function();


=================================



INSERT INTO "Leads"."leads" ("Name", "Age", "Email","_airbyte_raw_id","_airbyte_extracted_at","_airbyte_meta","Comments","Location","Phone_Number","Campaign_Name","Advertisement_Name","Advertisement_Source") VALUES ('John Doe', 30, 'john@example.com','006de08e-f28c-46c5-a9bd-8970edda9cd2','2024-05-05 13:49:41.556 +0530','{"changes": []}','string1','string1','string1','string1','string1','string1');


=================================


SELECT tgname AS trigger_name,
       tgrelid::regclass AS table_name,
       tgenabled AS enabled,
       tgdeferrable AS deferrable,
       tginitdeferred AS initially_deferred,
       pg_get_triggerdef(oid) AS trigger_definition
FROM pg_trigger 
where tgname='insert_into_workspace_1wgvd1injqtife6y4rvfbu3h5_lead'
ORDER BY tgrelid;


=================================
