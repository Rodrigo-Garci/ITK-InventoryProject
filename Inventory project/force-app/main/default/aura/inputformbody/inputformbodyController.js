({
    doInit : function(component, event, helper) {
          let action=component.get("c.getproduct");
          action.setCallback(this, function(response){
            var state = response.getState();
        if(state === "SUCCESS"){
            component.set("v.product", response.getReturnValue());
        }
          });
          $A.enqueueAction(action);
    },
    
    initBatch : function(component, event, helper) {
        let action=component.get("c.getbatch");
        action.setCallback(this, function(response){
          var state = response.getState();
      if(state === "SUCCESS"){
          component.set("v.batch", response.getReturnValue());
      }
        });
        $A.enqueueAction(action);
  },

    materials : function(component, event, helper) {
      let optionproduct=component.get("v.optionproduct");
      let action=component.get("c.materials")
      action.setParams({'product' : optionproduct});
      action.setCallback(this, function(response){
        console.log(response.getReturnValue);
        var state = response.getState();
        if(state === "SUCCESS"){
            component.set("v.material", response.getReturnValue());
        }
      });
      $A.enqueueAction(action);
   }

})
