#glg-tag-cm
Place tags on a council member with this element. The logged in user identity
and data connection to epiquery is all inside here, just set the cmid.


    Polymer 'glg-tag-cm',

##Events
*TODO* describe the custom event `name` and `detail` that are fired.

##Attributes and Change Handlers

      cmidChanged: ->
        @$.cmtags.withCredentials="true"
        @$.cmtags.url="http://epiquery.glgroup.com/tags/getTags.mustache?type=council_member&typeId=#{@cmid}"
        @$.cmtags.go()
        @$.alltags.withCredentials="true"
        @$.alltags.url="http://epiquery.glgroup.com/tags/list.mustache?type=council_member"
        @$.alltags.go()

##Methods

##Event Handlers
###filterAvailableTags
This takes all the existing tag options, as well as what you just typed
and gives a list of pick values.

      filterAvailableTags: (evt) ->
        matches = @alltags.filter (option) ->
          option.tag.toLowerCase().indexOf(evt.detail.value.toLowerCase()) > -1
        matches.unshift tag: evt.detail.value
        @tagoptions = matches

##Polymer Lifecycle

      created: ->

      ready: ->

      attached: ->

      domReady: ->

      detached: ->
