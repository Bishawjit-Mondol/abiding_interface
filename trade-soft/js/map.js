    var map;
    var geocoder;
    var a = "23.8100336";
    var b = "90.4117687";
    var map_container = "gps_map_sales_order";
    function InitializeMap() {

		
        var latlng = new google.maps.LatLng(a,b,21);
        var myOptions =
        {
            zoom: 18,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROAD,
            disableDefaultUI: true
        };
        map = new google.maps.Map(document.getElementById(map_container), myOptions);
    }

