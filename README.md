# README

Development assumptions:

* CustomFiledValue concept was described as a separate model since it is easier to perform validation and handle the deletion

* Request specs were added to ensure working endpoints

* Since update logic is pretty simple I didn't extract it to separate service with param's validation which could be performed using dry schema
  
*  We can describe all types of fields as separate classes using STI but for now, fields do not have much difference in logic based on type so we'll keep it simple

* Jbuilder is not prone to n+1 queries, keep in mind uploading associations when referring to them

* TODO: Consider the case when making a field required without having corresponding custom_field_values added can make custom_field_value invalid

* TODO: Consider the case when removing available_values from the select field if there are corresponding custom_field_values with a particular value that were deleted
  
* TODO - Add authentication and authorisation with policies(out of scope of this task)

* TODO - Handle RecordNotFound if this API would be used by external clients



