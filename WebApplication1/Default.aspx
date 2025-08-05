<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="hero-banner">
        <div class="hero-section">
        <div class="booking-card overlay">
            <div class="tabs">
                <button class="tab active"><i class="fas fa-taxi"></i> Cabs</button>
                <div class="tab-spacer"></div>
                <button class="tab"><i class="fas fa-bus"></i> Bus Tickets</button>
            </div>

            <div class="form-header">All India Cab Service</div>

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
                <input type="text" class="form-control" placeholder="Enter pickup city" />
                <i class="fas fa-location-arrow icon-right"></i>
            </div>

            <div class="input-group">
                <input type="text" class="form-control" placeholder="Enter destination city" />
                <i class="fas fa-map-marker-alt icon-right"></i>
            </div>

            <div class="add-more input-group bg-yellow">
                + Add More City
                <i class="fas fa-plus-circle icon-right"></i>
            </div>

            <div class="input-group">
                <select class="country-code">
                    <option>+91</option>
                </select>
                <input type="text" class="form-control" placeholder="8104881897" />
                <i class="fas fa-mobile-alt icon-right"></i>
            </div>

            <button class="book-btn">Check Price & Book Cab</button>
        </div>
    </div>


    </main>
</asp:Content>
