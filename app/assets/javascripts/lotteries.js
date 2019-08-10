$(document).ready(function() {
    $('#example').DataTable( {
        "processing": true,
        "serverSide": true,
        ajax: {
            url: '/get_lotteries',
            type: 'GET'
        },
        columns: [
            {title: 'Season', data: 'lottery_number'},
          ]
    } );
} );
// jQuery(document).ready(function() {
//     $('#blogs-datatable').dataTable({
//         "processing": true,
//         "serverSide": true,
//         "columnDefs": [{ "orderable": false, "targets": -1 }],
//         "ajax": $('#blogs-datatable').data('source'),
//         "pagingType": "full_numbers",
//         "columns": [
//             {"data": "lottery_number"},
//         ]
//         // pagingType is optional, if you want full pagination controls.
//         // Check dataTables documentation to learn more about
//         // available options.
//     });
// });

// $('#ajax-table').DataTable({
//     ajax: '/lotteries',
//     columns: [
//       {title: 'Lottery Number', data: 'lottery_number'}
//     ]
//   });

// $('#ajax-table').DataTable({
//     ajax: '/get_lotteries',
//     columns: [
//       {title: 'Lottery', data: 'lottery_number'},
//     ]
//   });

// $('.datatable').DataTable({
//     ajax: '/get_lotteries',
//     columns: [
//       {title: 'Lottery', data: 'lottery_number'}
//     ],
//     // ajax: ...,
//     // autoWidth: false,
//     // pagingType: 'full_numbers',
//     processing: true,
//     serverSide: true,
  
//     // Optional, if you want full pagination controls.
//     // Check dataTables documentation to learn more about available options.
//     // http://datatables.net/reference/option/pagingType
// });