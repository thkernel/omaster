$(document).on('turbolinks:load', function(){


    $('#imputation-modal').on('shown.bs.modal', function() {
        // Get doctor by service
        ajaxFilterPost("#imputation_service_id", "/imputations/get_profiles", "GET");

    });
});