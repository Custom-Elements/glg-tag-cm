#glg-tag-cm
Place tags on a council member with this element. The logged in user identity
and data connection to epiquery is all inside here, just set the cmid.


    Polymer 'glg-tag-cm',

##Events
*TODO* describe the custom event `name` and `detail` that are fired.

##Attributes and Change Handlers

      cmidChanged: ->        
        @$.cmtags.withCredentials = true
        @$.cmtags.url = "#{@src}/tags/getTags.mustache"
        @$.cmtags.params = 
          type: "council_member"
          typeId: @cmid
        @$.cmtags.go()

        @$.alltags.withCredentials = true
        @$.alltags.url = "#{@src}/tags/list.mustache"
        @$.alltags.params = 
          type: "council_member"
        @$.alltags.go()      

##Methods

##Event Handlers
###filterAvailableTags
This takes all the existing tag options, as well as what you just typed
and gives a list of pick values.

      filterAvailableTags: (evt) ->
        matches = @alltags.filter (option) ->
          query = evt.detail?.value?.toLowerCase()
          optionText = option?.tag?.toLowerCase()
          optionText.indexOf(query) > -1
        matches.unshift tag: evt.detail.value
        @tagoptions = matches

###[add|remove]tag
This hooks up tag changes to save.

      addtag: (evt, detail) ->
        console.log 'add', detail, @$.user.currentuser
        @$.addtag.method = "POST"
        @$.addtag.withCredentials = true
        @$.addtag.url = "#{@src}/tags/addTag.mustache"
        @$.addtag.params =
          type: "council_member"
          typeId: @cmid
          tag: detail.tag
          createdBy: @$.user.currentuser.personId
        @$.addtag.go()

      removetag: (evt, detail) ->
        console.log 'remove', detail
        @$.removetag.method = "POST"
        @$.removetag.withCredentials = true
        @$.removetag.url = "#{@src}/tags/deleteTag.mustache"
        @$.removetag.params =
          type: "council_member"
          typeId: @cmid
          tag: detail.tag
        @$.removetag.go()

##Polymer Lifecycle

      created: ->

      ready: ->

      attached: ->

      domReady: ->        

      detached: ->
