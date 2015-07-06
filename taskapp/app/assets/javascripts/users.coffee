# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#init = ->
#  $(document).ajaxStart ->
#    $('#count').html("通信中...")

  $(document).on 'click', 'span.btn-default', ->
    user_id = $(this).data('user_id')
    task_id = $(this).data('task_id')
    $.ajax({
      type: 'POST'
      url: '/users/'+user_id+'/works'
      dataType: 'json'
      data: { task_id: task_id }
    })
    $.ajax(
      type: 'POST'
      url: '/users/'+user_id+'/works/count'
    ).done (data) ->
      $("#task-#{task_id}").html("<span class=\"btn btn-success\" data-user_id=\"#{user_id}\" data-task_id=\"#{task_id}\"><i class=\"glyphicon glyphicon-ok-circle\">完了</i></span>")
      $('#count').html(data)

  $(document).on 'click', 'span.btn-success', ->
    user_id = $(this).data('user_id')
    task_id = $(this).data('task_id')
    $.ajax({
      type: 'POST'
      url: '/users/'+user_id+'/works'
      dataType: 'json'
      data: { task_id: task_id }
    })
    $.ajax(
      type: 'POST'
      url: '/users/'+user_id+'/works/count'
    ).done (data) ->
      $("#task-#{task_id}").html("<span class=\"btn btn-default\" data-user_id=\"#{user_id}\" data-task_id=\"#{task_id}\"><i class=\"glyphicon glyphicon-ban-circle\">未完了</i></span>")
      $('#count').html(data)

#$(document).ready(init)
#$(document).on('page:change', init)
