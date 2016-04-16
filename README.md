確認している動作環境は
Rails 4.2.0

一応、アプリを動作させるための手順は、まずダウンロードして、次のコマンドです。

cd taskapp

rake db:migrate

rake db:fixtures:load

rails s

rootのページ（トップページ）からUsersのたとえば、yyamadaをクリックすると、users#showのページに移り、「未完了」のボタンが現れます。これはタスクが終了したことを記録するためのトグルボタンです。「未完了」→「完了」になり、finished count: のところも一つカウントされ表示されます。

トグルボタンは画面推移することなく、トグルボタンとfinished countのみ表示が同時に変化するような仕組みになっていて、ajaxの非同期による通信で実現しています。
