$(document).ready(function () {
	// 서버 측 DB에서 데이터를 가져와서 그 데이터를 기반으로 DataTable을 생성한다.
	//프로젝트 구현 시 $('#dataTable').DataTable 은 검색 버튼이 눌렸을 때 실행되어야 한다.

	/* DataTable 관련 코드 */
	var dt = $('#dataTable').DataTable({
		columnDefs: [ //열 대한 속성 정의
			{
				visible: false, //해당 컬럼이 안 보이게 한다
				targets: [0]
			},
			{
				className: 'align-middle text-nowrap',
				targets: [0, 1, 2, 3, 4, 5]
			},
			{
				orderable: false, //정렬 화살표 노출 안 함
				className: 'text-center', //해당 열의 th, td에 클래스를 추가할 수 있음
				targets: [5]  //몇번째 열에 대한 것인지 표시함
			}
		],

		// 처음에 두번째 열을 기준으로 내림차순 정렬
		order: [[0, 'desc']],
	});
	/* End of DataTable 관련 코드 */
});
