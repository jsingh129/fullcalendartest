# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $('#calendar').fullCalendar
        editable: true,
        header:
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        defaultView: 'month',
        height: 850,
        slotMinutes:30,
        
        eventSources: [{
            url: '/events.json',
        }]
        
        timeFormat: 'h:mm',
        dragOpacity: "0.5"
        

            
        
        
