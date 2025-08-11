<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="hero-banner">
        <div class="hero-section">
        <div class="booking-card overlay">
            <div id="menu" class="form-selector">
                <table class="menu">
                    <tbody>
                        <tr>
                            <td id="cabTab" class="menu-column-left menu-column-selected" onclick="sessionStorage.setItem('curTab', 'cab'); location.assign('/');">
                                <a href="/" style="color: #000;"><span><i class="fa fa-car fa-lg"></i></span><br><span class="text-small">Cabs</span></a>
                            </td>
                            <td id="busTab" class="menu-column menu-column-right" onclick="sessionStorage.setItem('curTab', 'bus');  location.assign('bus-ticket-booking');">
                                <a href="bus-ticket-booking" style="color: #000;"><span><i class="fa fa-bus fa-lg"></i></span><br><span class="text-small">Bus Tickets</span></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="cabPanel" class="row card booking-block" style="display: block;">
    <div class="block-heading">All India Cab Service</div>

    <div class="form-selector">
        <table>
            <tbody>
                <tr>
                    <td id="outstationTab" style="width: 49%" 
                        class="hover-yellow-box top-selector-active" 
                        onclick="main.onclickOutstation()">
                        <span class="text-bold">Outstation</span>
                    </td>
                    <td style="width: 2%"></td>
                    <td id="localTab" style="width: 49%" 
                        class="hover-yellow-box" 
                        onclick="main.onclickLocal()">
                        <span class="text-bold one-way-trip-button">Local / Airport</span>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div id="outstationPanel">
        <div class="form-selector">
            <table>
                <tbody>
                    <tr>
                        <td style="width: 49%" class="grey-box text-left">
                            <label class="radio-container left-indent" 
                                   onclick="main.onclickRoundTrip()">
                                Round Trip
                                <input id="roundTripTab" type="radio" name="trip-type">
                                <span class="checkmark"></span>
                            </label>
                        </td>
                        <td style="width: 2%"></td>
                        <td style="width: 49%" class="grey-box text-left">
                            <label class="radio-container left-indent" 
                                   onclick="main.onclickOneWay()">
                                One Way Trip
                                <input id="oneWayTab" type="radio" checked name="trip-type">
                                <span class="checkmark"></span>
                            </label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <p id="roundTripTitle" 
           class="text-thin text-grey text-left form-remark" 
           style="display:none">
            <!-- Round trip / Multi-City Trip -->
        </p>

        <p id="oneWayTitle" 
           class="text-thin text-grey text-left form-remark" 
           style="display:block">
            <!-- *For Multiple Stops, Choose Round Trip -->
        </p>
        <div class="row" id="itineraryBlock" style="display:none">
    <div class="col-sm-12 text-left">
        <small>Your Itinerary</small>
        <div id="itineraryRepeat" class="form-group-no-border form-selector">
            <!-- itinerary plotted form js -->
        </div>
    </div>
</div>

<br id="itineraryNewLine" style="display:none" class="hidden-lg-down">

<small id="pickupError" class="text-danger text-left" style="display:none">
    Enter valid pickup city
</small>
<div class="form-selector grey-box text-left" id="pickupCity" style="display:block">
    <div id="pickupDataList" class="datalistWrapper" style="display: none;"></div>
    <input id="pickupCityAutocomplete" type="text" class="form-textbox" 
           placeholder="Enter pickup city" autocomplete="off" 
           onkeyup="main.delay(main.populatePickupDataList, 500);">
    <span id="pickupIcon" class="form-textbox-icon">
        <i class="fa fa-location-arrow"></i>
    </span>
</div>

<small id="goingError" class="text-danger text-left" style="display:none">
    Enter valid destination city
</small>
<div class="form-selector grey-box text-left" id="goingTo" style="display:block;">
    <div id="goingToDataList" class="datalistWrapper" style="display: none;"></div>
    <input id="goingToAutocomplete" type="text" class="form-textbox" 
           placeholder="Enter destination city" autocomplete="off" 
           onkeyup="main.delay(main.populateGoingToDataList, 500);">
    <span id="goingIcon" class="form-textbox-icon">
        <i class="fa fa-map-marker fa-lg"></i>
    </span>
</div>

<div class="form-selector add-destination add-destination-disabled text-left" id="plusButtonBlock">
    <span onclick="main.onPlusButton();return false;" id="plusButton" class="form-textbox">
        + Add More City
    </span>
    <span class="form-textbox-icon">
        <i class="fa fa-stop-circle-o"></i>
    </span>
</div>

</div> <!-- Possibly extra closing div? -->

<div id="localPanel" style="display: none;">
    <div class="form-selector">
        <table style="width:100%">
            <tbody>
                <tr>
                    <td style="width: 49%" class="grey-box text-left">
                        <label class="radio-container left-indent" onclick="main.onclickLocalRental()">
                            Local Rental
                            <input id="localRentalTab" type="radio" name="local-trip-type">
                            <span class="checkmark"></span>
                        </label>
                    </td>
                    <td style="width: 2%"></td>
                    <td style="width: 49%" class="grey-box text-left">
                        <label class="radio-container left-indent" onclick="main.onclickAirport()">
                            Airport Transfer
                            <input id="airportTab" type="radio" checked name="local-trip-type">
                            <span class="checkmark"></span>
                        </label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div id="localRental" style="display: none;">
        <small id="localPickupError" class="text-danger text-left" style="display:none">
            Select city where cab is required
        </small>
        <div class="form-selector grey-box text-left">
            <input name="dropdownLocalCity" id="dropdownLocalCity" class="form-textbox" 
                   placeholder="Select City" autocomplete="off" 
                   onkeyup="main.filterLocalCity();" 
                   onclick="document.getElementById('localCity').style.display = 'block';">
            <!-- onclick="main.toggleLocalCityDropDown();" -->
            <div id="localCity" class="datalistWrapper" style="display: none;">
                <!-- populated by js -->
            </div>
            <span id="localPickupIcon" class="form-textbox-icon">
    <i class="fa fa-map-marker fa-lg"></i>
</span>
</div>

<small id="localPackageError" class="text-danger text-left" style="display:none">
    Select local sightseeing package
</small>
<div class="form-selector grey-box text-left">
    <span class="form-textbox" style="line-height: 60px; display: inline-block;" 
          id="dropdownLocalPackage" type="button" 
          onclick="document.getElementById('localPackage').style.display = 'block';">
        <!-- onclick="main.togglePackageDropDown();" -->
        Select package
    </span>
    <div id="localPackage" class="datalistWrapper" style="display: none;">
        <a class="dropdown-item" href="javascript:main.onLocalPackageChange('2_20', '2 hours, 20 Km');">
            2 hours, 20 Km
        </a>
        <a class="dropdown-item" href="javascript:main.onLocalPackageChange('4_40', '4 hours, 40 Km');">
            4 hours, 40 Km
        </a>
        <a class="dropdown-item" href="javascript:main.onLocalPackageChange('8_80', '8 hours, 80 Km');">
            8 hours, 80 Km
        </a>
        <a class="dropdown-item" href="javascript:main.onLocalPackageChange('12_120', '12 hours, 120 Km');">
            12 hours, 120 Km
        </a>
    </div>
    <span id="localPackageIcon" class="form-textbox-icon">
        <i class="fa fa-map-marker fa-lg"></i>
    </span>
</div>
</div>

<div id="airportTransfer">
    <small id="airportFareTypeError" class="text-danger text-left" style="display:none">
        Select From Airport or To Airport
    </small>
    <div class="form-selector grey-box text-left">
        <span class="form-textbox" style="line-height: 60px; display: inline-block;" 
              id="dropdownAirportFareType" type="button" 
              onclick="document.getElementById('airportFareType').style.display = 'block';">
            From Airport / To Airport
        </span>
        <div id="airportFareType" class="datalistWrapper" style="display: none;">
            <a class="dropdown-item" href="javascript:main.onAirportFareTypeChange('from-airport', 'From Airport');">
                From Airport
            </a>
            <a class="dropdown-item" href="javascript:main.onAirportFareTypeChange('to-airport', 'To Airport');">
                To Airport
            </a>
        </div>
        <span id="airportFareTypeIcon" class="form-textbox-icon">
            <i class="fa fa-caret-down fa-lg"></i>
        </span>
    </div>

    <small id="airportError" class="text-danger text-left" style="display:none">
        Select Airport
    </small>
    <div class="form-selector grey-box text-left">
        <input name="dropdownAirport" id="dropdownAirport" class="form-textbox" 
               placeholder="Select Airport" autocomplete="off" 
               onkeyup="main.filterAirport();" 
               onclick="document.getElementById('airport').style.display = 'block';">
        <div id="airport" class="datalistWrapper" style="display: none;">
            <!-- populated by js -->
        </div>
        <span id="airportIcon" class="form-textbox-icon">
            <i class="fa fa-location-arrow"></i>
        </span>
    </div>

    <div id="destinationCityField" style="display: none;">
        <small id="destinationCityError" class="text-danger text-left" style="display:none">
            <!-- populated by js -->
        </small>
        <div class="form-selector grey-box text-left">
            <span class="form-textbox" style="line-height: 60px; display: inline-block;" 
                  id="dropdownDestinationCity" type="button" 
                  onclick="document.getElementById('destinationCity').style.display = 'block';">
                <!-- populated by js -->
            </span>
            <div id="destinationCity" class="datalistWrapper" style="display: none;">
                <!-- populated by js -->
            </div>
            <span id="destinationCityIcon" class="form-textbox-icon">
                <i class="fa fa-map-marker fa-lg"></i>
            </span>
        </div>
    </div>
</div>
</div>

<div>
    <small id="phoneError" class="text-danger text-left" style="display:none">
        Enter valid mobile number without '0' at start.
    </small>
    <div class="form-selector grey-box text-left">
        <span class="form-textbox" style="line-height: 60px; display: inline-block; width: 90px; overflow: hidden; font-size: 13px;" 
              id="dropdownCountryCode" type="button" 
              onclick="document.getElementById('countryCode').style.display = 'block';">
            <!-- onclick="main.toggleCountryCodeDropDown();" -->
            🇮🇳 +91
        </span>
        <span style="line-height: 60px; vertical-align: top;" 
              id="dropdownCountryCodeArrow" 
              onclick="document.getElementById('countryCode').style.display = 'block';">
            <i class="fa fa-caret-down"></i>
        </span>
        <input id="phoneText" type="text" class="form-textbox" 
               style="width: calc(90% - 100px); vertical-align: top; padding-left: 5px;" 
               placeholder="Enter mobile number" 
               onkeypress="return event.charCode >= 48 && event.charCode <= 57" 
               onchange="main.onPhoneChange(this.value)">
        <span id="phoneIcon" class="form-textbox-icon" 
              style="font-size: 24px; vertical-align: top; line-height: 60px;">
            <i class="fa fa-mobile fa-lg"></i>
        </span>
   <div id="countryCode" class="datalistWrapper" style="max-width: 85vw;overflow-x: hidden; display: none;">

     <div class="form-btn" onclick="main.onSearchCabs();"><span unselectable="on" class="text-bold text-unselectable">Check Price &amp; Book Cab</span></div></div></div>

   
           <%-- <div class="form-header">All India Cab Service</div>
            <div class="trip-type-buttons">
                <button class="trip-button active">Outstation</button>
                <button class="trip-button">Local / Airport</button>
            </div>
            <div class="trip-mode">
                <label class="mode-option">
                    <input type="radio" name="tripMode" /> Round Trip
                </label>
                <label class="mode-option active">
                    <input type="radio" name="tripMode" checked /> One Way Trip
                </label>
            </div>

            <div class="input-group">
                <input type="text" style="border-radius: 15px;" class="form-control" placeholder="Enter pickup city" />
                <i class="fas fa-location-arrow icon-right"></i>
            </div>

            <div class="input-group">
                <input style="border-radius: 15px;" type="text" class="form-control" placeholder="Enter destination city" />
                <i class="fas fa-map-marker-alt icon-right"></i>
            </div>

            <div class="add-more input-group bg-yellow">
                + Add More City
                <i class="fas fa-plus-circle icon-right"></i>
            </div>

            <div class="input-group" style="flex-wrap: unset;">
                <select class="country-code" style="border: unset;border-radius: 15px 0px 0px 15px;">
                    <option>+91</option>
                </select>
                <input style="border-radius: 0px 15px 15px 0px;" type="text" class="form-control" placeholder="8104881897" />
                <i class="fas fa-mobile-alt icon-right"></i>
            </div>

            <button class="book-btn">Check Price & Book CabR</button>--%>
        </div>
    </div>
            </div>
            </div>

    </main>
</asp:Content>
