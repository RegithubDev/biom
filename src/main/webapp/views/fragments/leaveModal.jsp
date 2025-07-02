<!-- leaveModal.jsp -->
<form id="applyLeaveForm" class="needs-validation" novalidate>
  <div class="modal-header">
    <h5 class="modal-title" id="leaveModalLabel">Apply Leave</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal"
            aria-label="Close"></button>
  </div>

  <div class="modal-body">

    <!-- Employee -->
    <div class="mb-3">
      <label for="leaveEmp" class="form-label">Employee</label>
      <select id="leaveEmp" class="form-select" required
              aria-describedby="leaveEmpHelp"></select>
      <div id="leaveEmpHelp" class="form-text">
        Leave will be applied to the selected employee.
      </div>
      <div class="invalid-feedback">Employee selection is required.</div>
    </div>

    <!-- Multi-day toggle -->
    <div class="form-check form-switch mb-4">
      <input class="form-check-input" type="checkbox" id="multiDayToggle"
             aria-describedby="multiToggleNote">
      <label class="form-check-label" for="multiDayToggle">
        Apply for multiple days
      </label>
      <span id="multiToggleNote" class="visually-hidden">
        Toggle between single and multi-day leave
      </span>
    </div>

    <!-- Multi-day -->
    <div class="row g-3 multi-only d-none mb-4">
      <div class="col-md">
        <label for="leaveFrom" class="form-label">Leave From</label>
        <input type="date" id="leaveFrom" class="form-control">
      </div>
      <div class="col-md">
        <label for="leaveTo" class="form-label">Leave Till</label>
        <input type="date" id="leaveTo" class="form-control">
      </div>
    </div>

    <!-- Single-day -->
    <div class="single-only">
      <div class="mb-4">
        <label for="leaveDate" class="form-label">Leave Date</label>
        <input type="date" id="leaveDate" class="form-control">
      </div>

      <fieldset class="mb-4">
        <legend class="fs-6 fw-normal mb-1">Duration</legend>
        <div class="form-check form-check-inline">
          <input class="form-check-input" type="radio" name="duration"
                 id="fullDay" value="Full" checked>
          <label class="form-check-label" for="fullDay">Full Day</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input" type="radio" name="duration"
                 id="halfDay" value="Half">
          <label class="form-check-label" for="halfDay">Half Day</label>
        </div>

        <!-- Half-day sub-options -->
        <div id="halfDayBlock" class="mt-3 d-none">
          <label for="halfType" class="form-label">Select half -</label>
          <select id="halfType" class="form-select w-auto g-3 d-inline-block">
            <option value="FIRST">First Half</option>
            <option value="SECOND">Second Half</option>
          </select>
        </div>
      </fieldset>
    </div>

    <!-- Leave type & remarks -->
    <div class="mb-4">
      <label for="leaveType" class="form-label">Leave Type</label>
      <select id="leaveType" class="form-select">
        <option value="SL">Sick Leave</option>
        <option value="CL">Casual Leave</option>
        <option value="EL">Earned Leave</option>
      </select>
    </div>

    <div class="mb-3">
      <label for="leaveRemarks" class="form-label">Remarks</label>
      <textarea id="leaveRemarks" class="form-control" rows="2"></textarea>
    </div>
  </div>

  <div class="modal-footer">
    <button type="submit" class="btn btn-primary">Apply</button>
    <button type="button" class="btn btn-secondary" id="leaveCancelBtn" data-bs-dismiss="modal">
      Cancel
    </button>
  </div>
</form>

<!-- JS (leave-form) -->
<script>
(() => {
  const $form = $('#applyLeaveForm');
  const $toggle = $('#multiDayToggle');
  const $durationRad = $('input[name="duration"]');
  const $halfBlock = $('#halfDayBlock');

  /* visibility helpers */
  const syncBlocks = () => {
    const multi = $toggle.prop('checked');
    $('.multi-only').toggleClass('d-none', !multi);
    $('.single-only').toggleClass('d-none',  multi);
    // if we just switched to multi-day, hide half-block unconditionally
    if (multi) $halfBlock.addClass('d-none');
  };

  const syncHalfBlock = () => {
    const half = $('#halfDay').prop('checked');
    $halfBlock.toggleClass('d-none', !half);
  };
  
  const closeModal = () => {
      $('#applyLeaveModal').modal('hide');
   	  $('body').removeClass('modal-open');
   	  $('.modal-backdrop').remove();
  }
  
  const resetApplyLeaveForm = () => {
    $form[0].reset(); // clear built-in fields & radios
	$form.removeClass('was-validated');
	syncBlocks(); // put correct sections back
	syncHalfBlock(); // hide half-day picker
  };

  /* init listeners */
  $toggle.on('change', syncBlocks);
  $durationRad.on('change', syncHalfBlock);
  $('#leaveCancelBtn').on('click', resetApplyLeaveForm); 

  // run once on load so everything is in the right state
  syncBlocks();
  syncHalfBlock();

  /* form submit */
  $form.on('submit', function (e) {
    e.preventDefault();

    // client validation
    if (!this.checkValidity()) {
      this.classList.add('was-validated');
      return;
    }

    const empRaw = $('#leaveEmp').val() || '';
    const [empCode = '', empName = ''] = empRaw.split(' - ');

    const multi = $toggle.prop('checked');
    const half = $('#halfDay').prop('checked');

    // validate dates
    if (multi) {
      const from = $('#leaveFrom').val(), to = $('#leaveTo').val();
      if (!from || !to || to < from) {
        alert('Please choose a valid From and To date.'); return;
      }
    } else if (!$('#leaveDate').val()) {
      alert('Please choose a leave date.'); return;
    }

    const dto = {
      empCode,
      employeeName: empName,
      leaveType: $('#leaveType').val(),
      remarks:   $('#leaveRemarks').val(),
      multiple:  multi,
      halfDay:   !multi && half,
      halfDaySlot: half ? $('#halfType').val() : null
    };

    if (multi) {
      dto.fromDate = $('#leaveFrom').val();
      dto.toDate   = $('#leaveTo').val();
    } else {
      dto.workDate = $('#leaveDate').val();
    }

    $.ajax({
      url:  '<%= request.getContextPath() %>/v2/attendance/leave',
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify(dto),
      success: () => {
    	  alert("Leave applied successfully");
    	  closeModal();
    	  resetApplyLeaveForm();
    	  $('#attendanceTable').DataTable().ajax.reload(null, false);
      },
      error: (xhr) =>
        alert(xhr.responseText || 'Error submitting leave')
    });
  });
})();
</script>
