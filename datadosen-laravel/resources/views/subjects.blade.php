@extends('master')

@section('title',"Subject")

@section('content')


<div class="mb-3">
  <a href="/home" class="btn btn-secondary"> Back to Profile </a>
</div>
<br>

<div class="row">
  <!-- SUBJECTS -->
  <!-- If the lecturer teach more than one subject -->
    @if(!empty($subject) && count($subject) != 1)
    <div class="container ">
      <div class="row  justify-content-center">
    {{-- <div class="card-deck"> --}}
      <!-- Count variable will be used to access the array of isDownloadable variable -->
      <?php $count = -1?>
      <?php $col = -1?>

      @foreach ($subject as $key => $value)
      <?php $count++;$col++;?>
      @if($col >= 3)
        
        <div class="card col-sm-3 mb-4 ml-4 mt-4  mr-4 mb-2 p-4">
      @else
        <div class="card col-sm-3 ml-4 mr-4 mb-2 p-4">
      @endif
        <div class="text-center">
          <img class="card-img-top" src="{{asset('images/docx.png')}}" style="height:150px;width:150px;"
            alt="">
        </div>
        <div class="card-body">
          <hr>
          <h5 class="card-text pull-left" style="font-size:1.2em">
            <center>{{$value->subject}}</center>
          </h5>
          <br>
          <p class="card-text pull-right"> {{$value->class}} </p>
          <!-- End of body card -->
        </div>

        <div class="card-footer">
          <div class="justify-content-center">
            <div class="p-2 flex-fill">
              <div class="dropdown mx-auto text-center">
                <!-- Dropdown upload -->
                <button class="btn btn-primary dropdown-toggle" style="width:12em" data-toggle="dropdown">
                  Upload
                </button>
                <form action="lec_home/uploadContract" method="POST">
                  <input type="hidden" name="subject_code" value="{{$value->subject_code}}">
                  <ul class="dropdown-menu">
                    @if($isDownloadable[$count])
                    <div class="alert alert-success" role="alert">
                      <strong>Belum selesai pak, maaf</strong>
                    </div>
                    @else
                    <div class="alert alert-warning" role="alert">
                      <strong>Be the first to upload</strong>
                    </div>
                    @endif
                    
                    <input name="userfile" type="file" />
                    <hr>
                    <li class="text-center">
                      <input type="submit" class="btn btn-info" value="Submit" disabled> </li>
                </form>
                </ul>
                <!-- End of upload's dropdown -->
              </div>
              <!-- End of upload flex's section -->
            </div>
            @if($isDownloadable[$count])
            <div class="p-2 text-center flex-fill">
              <form action="lec_home/downloadContract" method="POST">
                <input type="hidden" name="subject_code" value="{{$value->subject_code}}">
                <input type="hidden" name="code" value="{{$code}}">
                <input class="btn btn-secondary" type="submit" disabled value="Download">
              </form>
            </div>
            @endif
            <!-- End of footer's buttons -->
          </div>
          <!-- End of card deck -->
        </div>
        <!-- End of  a card-->
      </div>
      @endforeach
      <!-- Reset -->
      <?php $count = -1?>
      <?php $col = -1?>
      <!-- If the lecturer teach only one subject -->
    @elseif(!empty($subject) && count($subject) == 1)
      <div class="col-sm-4">
        <div class="card">
          <div class="text-center">
            <img class="card-img-top" src="{{asset('/images/docs.png')}}" style="height:150px;width:150px;"
              alt="">
          </div>
          <div class="card-body">
            <hr>
            <h5 class="card-text pull-left" style="font-size:1.2em">
              <center>{{$subject[0]->subject}}</center>
            </h5>
            <br>
            <p class="card-text pull-right"> {{$subject[0]->class}} </p>
            <!-- End of card body -->
          </div>

          <div class="card-footer">
            <div class="d-flex flex-row justify-content-center">
              <div class="p-2 flex-fill">
                <div class="dropdown mx-auto text-center">
                  <!-- Dropdown upload -->
                  <button class="btn btn-primary dropdown-toggle" style="width:9em" data-toggle="dropdown">
                    Upload
                  </button>
                  <form action="lec_home/uploadContract" method="POST">
                    <input type="hidden" name="subject_code" value="{{$subject[0]->subject_code}}">
                    <ul class="dropdown-menu">
                      @if($isDownloadable[0])
                      <div class="alert alert-success" role="alert">
                        <strong>Update the contract file</strong>
                      </div>
                      @else
                      <div class="alert alert-warning" role="alert">
                        <strong>Be the first to upload</strong>
                      </div>
                      @endif
                      <input name="userfile" type="file" />
                      <hr>
                      <li class="text-center">
                        <input type="submit" class="btn btn-info" value="Submit"> </li>
                    </ul>
                  </form>

                </div>
              </div>
              @if($isDownloadable[0])
              <div class="p-2 text-center flex-fill">
                <form action="lec_home/downloadContract" method="POST">
                  <input type="hidden" name="subject_code" value="{{$subject[0]->subject_code}}">
                  <input type="hidden" name="code" value="{{$code}}">
                  <input class="btn btn-secondary" type="submit" value="Download">
                </form>
                @endif
              </div>
            </div>
          </div>
        </div>
      </div>

      @else
      <div class="mx-auto">
        <strong> You are not teaching anything </strong>
        {{count($subject)}}
      </div>
      @endif


      <!-- End of Subject list -->
    </div>

    <script>

      $('.dropdown').hover(function () {
        $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
      }, function () {
        $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
      });

    </script>





@endsection
