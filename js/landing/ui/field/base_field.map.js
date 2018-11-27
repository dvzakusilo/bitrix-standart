{"version":3,"sources":["base_field.js"],"names":["BX","namespace","escapeHtml","Landing","Utils","isString","random","clone","fireCustomEvent","UI","Field","BaseField","data","this","id","selector","content","title","placeholder","className","descriptionText","description","attribute","hidden","property","style","layout","createLayout","header","createHeader","innerHTML","appendChild","input","createInput","dataset","onValueChangeHandler","onValueChange","classList","add","createDescription","addEventListener","onPaste","bind","init","create","props","text","html","currentField","prototype","event","preventDefault","clipboardData","getData","document","execCommand","window","getNode","isChanged","trim","getValue","setValue","value","textOnly","toString","enable","disabled","remove","disable","reset","constructor"],"mappings":"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","file":""}