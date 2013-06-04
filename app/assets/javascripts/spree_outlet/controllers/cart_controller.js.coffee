App.CartController = Ember.ObjectController.extend(
  model: null
  couponCode: null
  addItem: (variantId, quantity) ->
    model = @get('model')
    if !model
      # Define a method on order class to create w/ item
      model = App.Order.createWithItem(variantId, quantity)
      @set('model', model)
    else
      model.addItem(variantId, quantity)

  empty: ->
    # Hit the api to empty items in the order?
    #@get('model').empty()
    @set('model', null)

  # checkout event
  checkout: ->
    state = @get('model.state')
    if state && state != 'cart'
      @transitionToRoute('checkout')
    else
      controller = @
      promise = @updateOrder()
      promise.then( ->
        controller.transitionToRoute('checkout')
      )
    

  clearFields: ->
    @setProperties(
      couponCode: null
    )

  updateOrder: ->
    order = @get('model')
    controller = @
    settings = 
      url: "api/checkouts/#{@get('model.number')}"
      type: "PUT"
    promise = Ember.$.ajax(settings)
    promise.then( (data) ->
      order.set('state', data.state)
    )

)