<%@ include file="Files/header.jsp" %> 
<!-- banner -->
<div class="inside-banner">
  <div class="container"> 
        <c:choose>
        <c:when test="${empty searchCriteria}">
            <span class="pull-right"><a href="index.jsp">Home</a> -> All Properties</span>
    <h2>Current Listings</h2>
        </c:when>
        <c:otherwise>
            <span class="pull-right"><a href="index.jsp">Home</a><a href="PropertiesServlet"> -> All Properties</a> -> Search Results</span>
    <h2>Search Results</h2>
        </c:otherwise>
    </c:choose>
</div>
</div>
<!-- banner -->


<div class="container">
<div class="properties-listing spacer">

<div class="row">
<div class="col-lg-3 col-sm-4 ">

  <div class="search-form">
      <h4><span class="glyphicon glyphicon-search"></span> Search for</h4>
      <form method="Post" action="SearchServlet">
      <select name="location" class="form-control">
          <option disabled selected value>Search Location...</option>
          <c:forEach items="${cities}" var="city">
              <option>${city}</option>
          </c:forEach>
      </select>
    <div class="row">
            <div class="col-lg-5">
              <select name="beds" class="form-control">
                <option disabled selected value>Bedrooms</option>
                <c:forEach items="${beds}" var="bed">
                    <option>${bed}</option>
                </c:forEach>
              </select>
            </div>
            <div class="col-lg-7">
              <select name="price" class="form-control">
                <option disabled selected value>Price</option>
                <option value="1">Less than $150,000</option>
                <option value="2">$150,000 - $200,000</option>
                <option value="3">$200,000 - $250,000</option>
                <option value="4">$250,000 - $300,000</option>
                <option value="5">$300,000 - above</option>
              </select>
            </div>
          </div>
      <div class="row">
           <div class="col-lg-7">
              <select name="size" class="form-control">
                <option disabled selected value>Square Foot</option>
                <option value="1">Less than 1000</option>
                <option value="2">1000 - 1500</option>
                <option value="3">1500 - 2000</option>
                <option value="4">2000+</option>
              </select>
            </div>
      </div>
          <div class="row">
          <div class="col-lg-12">
              <select name="type" class="form-control">
                     <option disabled selected value>Search style...</option>
                  <c:forEach items="${styles}" var="style">
                      <option>${style}</option>
                  </c:forEach>
              </select>
              </div>
          </div>
          <button class="btn btn-primary">Find Now</button>
          </form>
  </div>



<div class="hot-properties hidden-xs">
<h4>Hot Properties</h4>
    <c:forEach items="${recommened}" var="prop">
        <div class="row">
            <div class="col-lg-4 col-sm-5"><img src="images/properties/large/${prop.photo}/${prop.photo}.JPG" class="img-responsive img-circle" alt="properties"></div>
            <div class="col-lg-8 col-sm-7">
              <h5><a href="PropertiesServlet?singleView=${prop.id}">${prop.city}</a></h5>
              <p class="price"><fmt:formatNumber value="${prop.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></p>
            </div>
        </div>
    </c:forEach>
</div>


</div>

<div class="col-lg-9 col-sm-8">
<div class="sortby clearfix">

</div>
<div class="row">
    <c:choose>
        <c:when test="${empty searchCriteria}">
            <h4><span class="glyphicon glyphicon-search"></span> Enter Some Search Criteria</h4>
        </c:when>
        <c:otherwise>
            <h4><span class="glyphicon glyphicon-search"></span> Search Criteria: <c:forEach items="${searchCriteria}" var="criteria">
                    ${criteria},
                    
            </c:forEach> </h4>
        </c:otherwise>
    </c:choose>
     <!-- properties -->
     <c:forEach items="${returnPropList}" var="house">
      <div class="col-lg-4 col-sm-6">
      <div class="properties">
          <div class="image-holder"><a href="PropertiesServlet?singleView=${house.id}"><img style="height:150px; width: 100%;"  src="images/properties/large/${house.photo}/${house.photo}.JPG" class="img-responsive" alt="properties"></a>
          <div class="status sold">${house.statusId.status}</div>
        </div>
        <h4>${house.city}</h4>
        <p class="price">Price: <fmt:formatNumber value="${house.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></p>
        <div class="listing-detail"><span data-toggle="tooltip" data-placement="bottom" data-original-title="Bedrooms">${house.bedrooms}</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Bathrooms">${house.bathrooms}</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Parking">${house.garagesize}</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Ber Rating">${house.berRating}</span></div>
        <a class="btn btn-primary" href="PropertiesServlet?singleView=${house.id}">View Details</a>
      </div>
      </div>
      </c:forEach>
      <!-- properties -->
      
      
</div>
</div>
</div>
</div>
</div>

<%@ include file="Files/footer.jsp" %> 