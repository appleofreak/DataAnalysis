////////////////////////////////////////////////////
// DESIGN TOOLS CONFIG                            //
////////////////////////////////////////////////////
// Copyright (C) 2017  Utah State University
var DT_variables = {
        iframeID: '',
        // Path to the hosted USU Design Tools
        path: 'https://designtools.ciditools.com/',
        templateCourse: '6632',
        // OPTIONAL: Button will be hidden from view until launched using shortcut keys
        hideButton: false,
    	 // OPTIONAL: Limit by course format
	     limitByFormat: false, // Change to true to limit by format
	     // adjust the formats as needed. Format must be set for the course and in this array for tools to load
	     formatArray: [
            'online',
            'on-campus',
            'blended'
        ],
        // OPTIONAL: Limit tools loading by users role
        limitByRole: false, // set to true to limit to roles in the roleArray
        // adjust roles as needed
        roleArray: [
            'student',
            'teacher',
            'admin'
        ],
        // OPTIONAL: Limit tools to an array of Canvas user IDs
        limitByUser: true, // Change to true to limit by user
        // add users to array (Canvas user ID not SIS user ID)
        userArray: [
            '6896',
            '5'
        
        ]
};

// Run the necessary code when a page loads
$(document).ready(function () {
    'use strict';
    // This runs code that looks at each page and determines what controls to create
    $.getScript(DT_variables.path + 'js/master_controls.js', function () {
        console.log('master_controls.js loaded');
    });
});
////////////////////////////////////////////////////
// END DESIGN TOOLS CONFIG                        //
////////////////////////////////////////////////////

(function () {
    $('#context_external_tool_55_menu_item').hide();
    $('a[href="http://www.instructure.com"]').remove();
    $('a[href="https://learn.insead.edu/privacy_policy"]').remove();
    $('a[href="http://facebook.com/instructure"]').remove();
    $('a[href="http://twitter.com/instructure"]').remove();
    $("#footer-links").append("<a target='_blank' href='https://insead.service-now.com/kb_view_customer.do?sysparm_article=KB0011111'>Privacy policy</a> ");
    $("#footer-links").append("<a target='_blank' href='https://insead.service-now.com/kb_view_customer.do?sysparm_article=KB0011112'>Terms & Conditions</a> ");
    $("#footer-links").append("<a target='_blank' href='https://www.facebook.com/INSEAD/'>Facebook</a> ");
    $("#footer-links").append("<a target='_blank' href='https://twitter.com/INSEAD'>Twitter</a> ");
    var webMail = '<li class="ic-app-header__menu-list-item ">'
        + '<a id="global_nav_myINSEAD_link" href="https://webmail.insead.edu/" target="_blank" class="ic-app-header__menu-list-link">'
        + ' <div class="menu-item-icon-container" aria-hidden="true" style="background:url(https://cdn.insead.edu/lms/microsoft-outlook.png);background-size:contain;background-repeat-x: no-repeat;width: 32px;height: 32px;" role="presentation">'
        + ' <i class="icon-inbox icon-large" style="display: none;"></i>'
        + ' </div>'
        + ' <div class="menu-item__text">INSEAD Mail</div>'
        + '</a>'
        + '</li>';
    $('#menu.ic-app-header__menu-list li:nth-child(6)').after(webMail);
    var myINSEAD = '<li class="ic-app-header__menu-list-item ">'
        + '<a id="global_nav_myINSEAD_link" href="https://my.insead.edu/" target="_blank" class="ic-app-header__menu-list-link">'
        + ' <div class="menu-item-icon-container" aria-hidden="true" style="background:url(https://cdn.insead.edu/lms/go-back-to-myinsead-white.png);background-size:contain;background-repeat-x: no-repeat;width: 32px;height: 32px;" role="presentation">'
        + ' <i class="icon-inbox icon-large" style="display: none;"></i>'
        + ' </div>'
        + ' <div class="menu-item__text">MyINSEAD</div>'
        + '</a>'
        + '</li>';
    $('#menu.ic-app-header__menu-list li:nth-child(7)').after(myINSEAD);
    /*EvaluationKIT START*/
    var evalkit_jshosted = document.createElement('script'); evalkit_jshosted.setAttribute('type', 'text/javascript'); evalkit_jshosted.setAttribute('src', 'https://insead.evaluationkit.eu/CanvasScripts/insead.js?v=1'); document.getElementsByTagName('head')[0].appendChild(evalkit_jshosted);
    /*EvaluationKIT END*/
    $("#btnClick").click(function () {
        console.log("Clicking log");
        $('#firstColumn').html("Changing using custom script");
        $('#secondColumn').html("Changing using custom script");
    });
})();
$(window).load(function () {


    var head = jQuery("#course_syllabus_body_ifr").contents().find("head");
var css = '<style type="text/css">' +
          '.mce-item-table td{border: 2px solid #333}; ' +
          '</style>';
jQuery(head).append(css);



    if (window.location.pathname.match(/^\/courses\/\d+\/settings/) && (ENV.current_user_roles.includes('teacher') ||  ENV.current_user_roles.includes('user')) && !ENV.current_user_roles.includes('admin')) {
        $(".coursesettings tr td div.CourseImageSelector button").prop('disabled', true);
        $(".coursesettings tr td div.input-append button.ui-datepicker-trigger").prop('disabled', true);
        $(".coursesettings tr td #course_start_at").prop('disabled', true);
        $(".coursesettings tr td #course_conclude_at").prop('disabled', true);
        $(".coursesettings tr td #course_name").prop('disabled', true);
        $(".coursesettings tr td #course_course_code").prop('disabled', true);
        $(".coursesettings tr td #course_time_zone").prop('disabled', true);
        $(".coursesettings tr td #course_sis_source_id").prop('disabled', true);

        $(".coursesettings tr td #course_restrict_enrollments_to_course_dates").prop('disabled', true);
        $(".coursesettings tr td #course_locale").prop('disabled', true);

        $(".coursesettings tr td #course_grading_standard_enabled").prop('disabled', true);
        $(".coursesettings tr td #course_license").prop('disabled', true);
        $(".coursesettings tr td #course_course_visibility").prop('disabled', true);
        $(".coursesettings tr td #course_custom_course_visibility").prop('disabled', true);
        $(".coursesettings tr td #course_course_format").prop('disabled', true);
        $(".coursesettings tr td #course_indexed").prop('disabled', true);
        $(".coursesettings tr td #course_restrict_student_past_view").prop('disabled', true);
        $(".coursesettings tr td #course_restrict_student_future_view").prop('disabled', true);
        $(".coursesettings tr td #course_self_enrollment").prop('disabled', true);
    }
});


$(document).ready(function(){
	
	
	//$('.custom-resource-insead .tabs-insead').tabs();

	
	
});