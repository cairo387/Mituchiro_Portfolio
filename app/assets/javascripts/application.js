// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require moment
//= require fullcalendar
//= require_tree .
$(document).ready(function () {
  $("#images").skippr({
    // スライドショーの変化 ("fade" or "slide")
    transition : 'fade',
    // 変化に係る時間(ミリ秒)
    speed : 2500,
    // easingの種類
    easing : 'easeOutBack',
    // ナビゲーションの形("block" or "bubble")
    navType : 'block',
    // 子要素の種類("div" or "img")
    childrenElementType : 'div',
    // ナビゲーション矢印の表示(trueで表示)
    arrows : false,
    // スライドショーの自動再生(falseで自動再生なし)
    autoPlay : true,
    // 自動再生時のスライド切替間隔(ミリ秒)
    autoPlayDuration : 20000,
    // キーボードの矢印キーによるスライド送りの設定(trueで有効)
    keyboardOnAlways : true,
    // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
    hidePrevious : false
  });
});
$(function () {
  // 画面遷移を検知
  $(document).on('turbolinks:load', function () {
    if ($('#calendar').length) {
      const chiropractorId = $('#calendar').children('div').attr('id');
      console.log(chiropractorId.substr(9));

      function Calendar() {
        return $('#calendar').fullCalendar({
        });
      }
      function clearCalendar() {
        $('#calendar').html('');
      }

      $(document).on('turbolinks:load', function () {
        Calendar();
      });
      $(document).on('turbolinks:before-cache', clearCalendar);

      //events: '/events.json', 以下に追加
      $('#calendar').fullCalendar({
        events: `/chiropractors/${chiropractorId.substr(9)}/events/new`,
        //カレンダー上部を年月で表示させる
        titleFormat: 'YYYY年 M月',
        // 月名称
        monthNames: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
        // 月名称
        monthNamesShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
        dayNames: ['日', '月', '火', '水', '木', '金', '土'],
        //曜日を日本語表示
        dayNamesShort: ['(日)', '(月)', '(火)', '(水)', '(木)', '(金)', '(土)'],
        // スロットの時間の書式
        slotLabelFormat: 'H:mm',
        // 時間の書式
        timeFormat: 'H:mm',

        views: {
        month: {
        columnFormat: 'dddd' //like '土'
        },
        week: {
        columnFormat: 'DD\n　ddd' //like '6/6(土)'
        },
        day: {
        columnFormat: 'M/D ddd' // like '6/6(土)'
        }
        },
        //ボタンのレイアウト
        header: {
          left: 'prev',
          center: 'title',
          right: 'next'
        },
        //カレンダー始まりの日を今日に指定
        firstDay: 'today',
        //土日入る
        weekends: true,
        // 週モード (fixed, liquid, variable)
        weekMode: 'fixed',
        // 終日スロットを非表示
        allDaySlot: false,
        // スロットの分
        slotMinutes: 30,
        // 選択する時間間隔
        snapMinutes: 30,
        //予約開始時間の指定
        minTime:'09:00:00',
        //予約終了時間の指定
        maxTime:'22:00:00',
        //デフォルトのカレンダーを週間カレンダーに
        defaultView: 'agendaWeek',
        //終了時刻がないイベントの表示間隔
        defaultTimedEventDuration: '03:00:00',
        buttonText: {
          today: '本日',
          month: '月',
          week: '週',
          day: '日',
          prev: '◂前の一週間',
          next: '次の一週間▸'
        },
        // Drag & Drop & Resize
        editable: false,
        selectable: true,
        //イベントの色を変える
        eventColor: '#fff',
        //イベントの文字色を変える
        eventTextColor: '#CC0000',
        eventRender: function (event, element) {
          element.css("font-size", "0.8em");
          element.css("padding", "5px");
        },
        eventClick: function(item, jsEvent, view) {
          if(item.title == '◎'){
            //遷移先（予約フォーム）に情報を送る&chiropractor_id=${}
            location.href = `/reservations/new?start=${item.start}&end=${item.end}&chiropractor_id=${item.chiropractor_id}`
          }
        }
      });
    }
  });
});

