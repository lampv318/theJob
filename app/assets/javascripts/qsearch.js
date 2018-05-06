document.addEventListener("turbolinks:load", function() {
  $input = $("[data-behavior='autocomplete']")

   var options = {
    getValue: "name",
    url: function(phrase){
      return "qsearch.json?q=" + phrase;
    },
    categories: [
      {
        listLocation: "basics",
        header: "<strong>Name</strong>"
      },
      {
        listLocation: "users",
        header: "<strong>Email</strong>"
      }
    ],
    list: {
      onChooseEvent: function(){
        var url = $input.getSelectedItemData().url
        $input.val("")
        Turbolinks.visit(url)
      }
    }
  };

  $input.easyAutocomplete(options)
});

