<%--
  Created by IntelliJ IDEA.
  User: Mohammed Imran
  Date: 3/23/14
  Time: 10:17 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="oros">
    <r:script>
      $(document).ready(function(){
      $("#showImage").hide();
          $("#fileUpload").submit(function(e){
              var formData = new FormData(this);
              $.ajax({
                  url:'${createLink(controller: 'demo', action: 'save')}',
                  type:'post',
                  data:formData,
                  dataType :'json',
                  mimeType:'multipart/form-data',
                  contentType: false,
                  cache: false,
                  processData:false,
                  success: function (data){
                   var url=data.imagePath;
                   var uploadImage=data.imagePath.split('/').join('%2F');
                   var image="${createLink(controller: 'imageIndirect', action: 'index')}?imageName="+uploadImage;
                   $("#showImage").show();
                   $("#image").attr('src',image);
                   $("#url").attr('value',url);
                  }

              })
              e.preventDefault();
          });
         });
    </r:script>
</head>

<body>
<div class="col-md-12">

    <div class="alert alert-block alert-success">

        <p>
            Upload Your Picture
        </p>

        <form class="form-horizontal" name="fileUpload" id="fileUpload" method="POST" enctype="multipart/form-data">
            <p>
                <input type="file" class="btn btn-sm btn-success" name="document" id="document"/>
                <input class="btn btn-sm" type="submit" value="Upload" id="upload"/>
            </p>
        </form>

        <div id="showImage">
            <form name="downloadFile" id="downloadFile" action="${createLink(controller: 'demo', action: 'download')}"
                  method="post">
                <input type="text" name="url" id="url" hidden="" value=""/>
                <ii:imageTag indirect-imagename="" id="image" width="255px" height="150px"/>
                <input type="submit" name="download" class="btn btn-default" value="Download"/>
            </form>
        </div>
    </div>
</div>
</body>
</html>