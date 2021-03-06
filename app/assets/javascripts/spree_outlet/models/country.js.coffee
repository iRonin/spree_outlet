attr = Ember.attr

App.Country = Ember.Model.extend(
  id: attr()
  iso_name: attr()
  iso: attr()
  name: attr()
  numcode: attr()
  states: attr()
)

App.Country.reopenClass(
  url: "#{App.get('apiURL')}/countries"
  rootKey: null
  collectionKey: "countries"
)