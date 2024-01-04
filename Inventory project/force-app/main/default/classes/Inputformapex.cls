/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-27-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

public with sharing class Inputformapex {
    @AuraEnabled
    public static List<Prodoct__c> getproduct() {
        List<Prodoct__c> products = [SELECT Id, Name FROM Prodoct__c];
        return products; 

    }

    @AuraEnabled
    public static List<Batch__c> getbatch() {
        List<Batch__c> Batch = [Select Id, Name From Batch__c];
        return Batch;
    }
     
    @AuraEnabled(cacheable=true)
    public static List<Material__c> materials(string product) {
        String product_Id = string.escapeSingleQuotes(product);
        String query = 'SELECT Name, Prodoct__r.Id ' + 'FROM Material__c ' + 'WHERE Id = \'' +product_Id+'\'';
        System.debug(query); 
        return Database.query(query);
    }      
}