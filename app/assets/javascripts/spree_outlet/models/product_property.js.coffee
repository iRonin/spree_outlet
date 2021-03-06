attr = Ember.attr

App.ProductProperty = Ember.Model.extend(
	id: attr()
	product_id: attr()
	property_id: attr()
	property_name: attr()
	value: attr()
)

App.ProductProperty.reopenClass(
	url: "#{App.get('apiURL')}/product_properties"
	rootKey: null
	collectionKey: "product_properties"
)