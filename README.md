# Chat app

Demo volt app for montrealrb meetup Sep 15th - Sample voltrb chat application

See https://medium.com/product-dot-io/developer-happiness-with-volt-framework-150accdf6897 for more

Slides at http://www.slideshare.net/mtw/a-first-look-volt-framework-live-demo-with-heri-montrealrb

## Setup

Make sure you have ruby and mongodb installed in your system. Run:

`gem install volt`

`git clone git@github.com:heri/montrealrb-chat.git`

`cd montrealrb-chat`

To install the mongo gem and required components:

`bundle install`

To run the app:

`volt server`

You can now check it out on http://localhost:3000 :)

## What next?

The main page view is in app/main/views/main/index.html
The controller is app/main/controllers/main_controller.rb

You can try playing with the files or try adding channels. I would for example have:

```
<ul>
  {{ store.channels.each do |channel| }}
  <li><a href="/channel/{{ channel.id }}">{{ channel.name }}</a></li>
  {{ end }}
</ul>
```

It will require a route `client '/channel/{{ id }}', controller: 'channels', action: 'show'`

As well as a channel.rb
```
class Message < Volt::Model
  field :name, String
end
```

and a channel_controller.rb

```
module Main
  class ChannelController < Volt::ModelController

    before_action only: [ :add_channel, :index ] do
      require_login('Login')
    end

    def add_channel
      store.channels << { name: page._new_channel}
      page._new_channel = ''
    end

    def show
      # get the channel
      store.channels.where(id: params.id).first
    end
  end
end
```

It will be up to you how to display the chats in a given message, now that you have a channel.


## Reference

Docs for Volt are docs.voltframework.com/en/

I highly recommend checking out the community on Gitter. @ryanstout and many others (+ @heri) are there
