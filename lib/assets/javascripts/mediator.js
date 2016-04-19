mediator = (function() {
  var channels = {}, obj = {}, global = this;

  var ArrayProto = Array.prototype;

  var nativeSlice = ArrayProto.slice,
      nativeFilter = ArrayProto.filter;

  /* Internal: filters the collection. (extracted from underscore.js)
   *
   * Returns the filtered list, given a function condition.
   */
  function filter(obj, iterator, context) {
    var results = [];
    if (obj === null) return results;
    if (nativeFilter && obj.filter === nativeFilter) return obj.filter(iterator, context);
    for (var i = 0, l = obj.length; i < l; ++i) {
      if (iterator.call(context, obj[i], i)) results.push(obj[i]);
    }
    return results;
  }

  /* Public: register a callback to listen a channel.
   *
   * channel - the channel to subscribe
   * fn      - the callback function to be called
   * context - the context caller for the callback (optional)
   *
   * Example:
   *  var obj = { name: 'John' };
   *  mediator.on('user:loaded', function() {
   *    this.name = 'John Doe';
   *  }, obj);
   *  obj // => Object { name: 'John Doe' }
   */
  obj.on = function (channel, fn, context) {
    if (!channels.hasOwnProperty(channel)) channels[channel] = [];
    channels[channel].push({ fn: fn, context: context });
  };

  /* Public: sends a message to the channel.
   *
   * channel   - the channel to send the message
   * arguments - the arguments sent to the callback (optional)
   *
   * Example:
   *   mediator.trigger('user:loaded', { user_id: 1 });
   *   mediator.trigger('ids', 1, 2, 3);
   *   mediator.trigger('user:loaded');
   */
  obj.trigger = function (channel) {
    if (!channels.hasOwnProperty(channel)) return;
    var args = nativeSlice.call(arguments, 1),
        callbacks = channels[channel];
    for (var i = 0, l = callbacks.length; i < l; i++) {
      var subscription = callbacks[i];
      subscription.fn.apply(subscription.context || global, args);
    }
  };

  /* Public: unregister a callback from a channel.
   *
   * channel - the channel to unregister
   * fn      - the function to be removed from the channel
   *
   * Example:
   *   mediator.off('user:loaded', fn);
   */
  obj.off = function(channel, fn) {
    if (!channels.hasOwnProperty(channel)) return;
    channels[channel] = filter(channels[channel], function(subscription) {
      return subscription.fn !== fn;
    });
  };

  return obj;
}).call(this);