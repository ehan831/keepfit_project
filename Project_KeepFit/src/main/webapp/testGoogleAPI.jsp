<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
 
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Places Searchbox</title>
    <style>
        /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
 
        #map {
            height: 100%;
        }
 
        /* Optional: Makes the sample page fill the window. */
 
        html,
        body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
 
        #description {
            font-family: Roboto;
            font-size: 15px;
            font-weight: 300;
        }
 
        #infowindow-content .title {
            font-weight: bold;
        }
 
        #infowindow-content {
            display: none;
        }
 
        #map #infowindow-content {
            display: inline;
        }
 
        .pac-card {
            margin: 10px 10px 0 0;
            border-radius: 2px 0 0 2px;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            outline: none;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
            background-color: #fff;
            font-family: Roboto;
        }
 
        #pac-container {
            padding-bottom: 12px;
            margin-right: 12px;
        }
 
        .pac-controls {
            display: inline-block;
            padding: 5px 11px;
        }
 
        .pac-controls label {
            font-family: Roboto;
            font-size: 13px;
            font-weight: 300;
        }
 
        #pac-input {
            background-color: #fff;
            font-family: Roboto;
            font-size: 15px;
            font-weight: 300;
            margin-left: 12px;
            padding: 0 11px 0 13px;
            text-overflow: ellipsis;
            width: 400px;
        }
 
        #pac-input:focus {
            border-color: #4d90fe;
        }
 
        #title {
            color: #fff;
            background-color: #4d90fe;
            font-size: 25px;
            font-weight: 500;
            padding: 6px 12px;
        }
 
        #target {
            width: 345px;
        }
    </style>
</head>
 
<body> 



<div id="locationField"> <input id="autocomplete" placeholder="Enter your address" type="text"> </div> 
<input class="field" id="lat" /> <input class="field" id="lng" /> <!-- Replace the value of the key parameter with your own API key. --> <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCkUOdZ5y7hMm0yrcCQoCvLwzdM6M8s5qk&libraries=places&callback=initAutocomplete" async defer></script>


</body>
 
</html>