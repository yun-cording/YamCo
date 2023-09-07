/* 
reperence url :
	https://datatables.net/extensions/searchpanes/examples/customFiltering/customOptionConditions.html
	https://datatables.net/extensions/searchpanes/examples/
*/
$(document).ready(function () {
	// 서버 측 DB에서 데이터를 가져와서 그 데이터를 기반으로 DataTable을 생성한다.
	//프로젝트 구현 시 $('#dataTable').DataTable 은 검색 버튼이 눌렸을 때 실행되어야 한다.

	/* DataTable 관련 코드 */
	var dt = $('#dataTable').DataTable({
		/*
		reperence url : https://datatables.net/reference/option/#searchpanes
		*/
		searchPanes: {
			viewTotal: true,
			layout: 'columns-5', //searchPanes 내에서 한 줄에 나오는 열 개수 지정
			columns: [6, 9, 10, 12, 14] //searchPanes에서 사용할 DataTable 열
		},
		dom: 'Plfrtip', //Plfrtip이면 searchPanes가 table 위에 노출됨, frtipP이면 아래
		columnDefs: [ //열 대한 속성 정의
			{
				visible: false, //해당 컬럼이 안 보이게 한다
				targets: [0]
			},
			{
				className: 'align-middle text-nowrap',
				targets: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
			},
			{
				orderable: false, //정렬 화살표 노출 안 함
				className: 'text-center', //해당 열의 th, td에 클래스를 추가할 수 있음
				targets: [1, 6, 9, 10, 11, 12, 13, 14, 15]  //몇번째 열에 대한 것인지 표시함
			},
			{
				searchPanes: {
					show: true,
					initCollapsed: true,
					//아래 예와 같이 특정 옵션만 노출시킬 수 있음
					/* options: [
						{
							label: 'Male',
							value: function(rowData, rowIdx) {
								return rowData[6] == 'Male';
							}
						},
						{
							label: 'Female',
							value: function(rowData, rowIdx) {
								return rowData[6] == 'Female';
							}
						}
					] */
				},
				targets: [6, 9, 10, 12, 14]
			}
		],
		select: {
			/*
			reperence url : https://datatables.net/reference/option/select.style
			*/
			style: 'os', //style이 'single'이면 DataTable에서 다중선택 불가 등 제약이 있음, 자세한 설명은 위의 링크 참고
			selector: 'td:first-child' //선택 시 td의 첫번째 자식 태그가 선택됨
		},

		// 처음에 첫번째 열을 기준으로 내림차순 정렬
		order: [[0, 'desc']],

		//가로스크롤을 활성화시키지 않으면 DataTable에 가로스크롤이 생기지 않고 외부에 가로스크롤이 생길 수 있음
		//외부에 가로스크롤이 생길 경우 DataTable이 그 위에 있는 SearchPanes등 요소들과 너비가 일치하지 않을 수 있음
		scrollX: true
	});
	/* End of DataTable 관련 코드 */
});
