@if(isset($errors))
	@if(count($errors) > 0)

		@push('js')
		<script type="text/javascript">
	            Swal.fire({
	              type: 'warning',
	              title: "{{trans('user.error')}}",
	             title: "{!! '<br/>'.implode('<br/>', $errors->all()).'</br>'  !!}"

	            });
			</script>
		@endpush

	@endif
@endif

@if(session('success'))

	@push('js')
		<script type="text/javascript">
            Swal.fire({
              type: 'success',

              text: '{{ session('success') }}!',
              showConfirmButton: false,
             timer: 2000

            });
		</script>
	@endpush

@endif

@if(session('error'))
	@push('js')
		<script type="text/javascript">
            Swal.fire({
              type: 'warning',
              text: '{{ session('error') }}!',
              showConfirmButton: true,
            });
		</script>
	@endpush
@endif

@if(session('info'))
	@push('js')
		<script type="text/javascript">
            Swal.fire({
              type: 'success',

              text: '{{ session('info') }}!',
              showConfirmButton: true,


            });
		</script>
	@endpush
@endif