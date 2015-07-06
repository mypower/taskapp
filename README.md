確認している動作環境は
Rails 4.2.0

一応、アプリを動作させるための手順は、まずダウンロードして、次のコマンドです
cd taskapp
rake db:migrate
rake db:fixtures:load
rails s

rootのページ（トップページ）からUsersのたとえば、yyamadaをクリックすると、users#showのページに移り、「未完了」のボタンが現れます。これはタスクが終了したことを記録するためのトグルボタンです。「未完了」→「完了」になり、finished count: のところも一つカウントされ表示されます。

トグルボタンは画面推移することなく、トグルボタンとfinished countのみ表示が同時に変化するような仕組みになっていて、ajaxの非同期による通信で実現しています。

解決していない点です。

（１）HTMLのソースコードが変わりません。
（２）正確にfinished countが表示されません。
（３）users.coffeeに重複した記述があります。

「未完了」→「完了」にボタンの表示は変化しても、HTMLのソースコードはそのまま変化しません。finished countもボタンのクリックするタイミングによってカウントされたりされなかったりになります。また、ajaxの記述はapp\assets\javascripts\users.coffeeに記述していますが、coffeeスクリプトの記述に慣れていないため、コードが重複しています。

上記の３つを解決したいです。アドバイスいただけますと助かります。
