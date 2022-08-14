import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

import "./../../../../Fonts/Icon.js" as Icons

Item {
    Rectangle{
        anchors.fill: parent

        color: "#00ff0000"

        //-- container --//
        Rectangle{
            anchors.fill: parent

            color: color1

            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 3
                horizontalOffset: 3
                color: addOpacity(color4, 40)
                samples: 70
            }

            //-- logo and intro -//
            Rectangle{
                id: rec_head_activity

                height: parent.height * 0.25
                width: parent.width + (20 * ratio)
                color: "#00000000"

                //-- red background --//
                Canvas{
                    id: mycanvas
                    anchors.fill: parent

                    layer.enabled: true
                    layer.effect: DropShadow {
                        verticalOffset: 3
                        horizontalOffset: 0
                        color: addOpacity(color4, 40)
                        samples: 40
                    }


                    onPaint: {
                        var ctx = getContext("2d");

                        //-- set red color --//
                        ctx.fillStyle = "#1684A7"

                        //-- shadow --//
                        //                                ctx.shadowBlur = 10;
                        //                                ctx.shadowOffsetX = 3;
                        //                                ctx.shadowOffsetY = 3;
                        //                                ctx.shadowColor = Util.color_StatusBar;

                        var margin = 5;
                        var x1 = 0 + margin;
                        var x2 = width - margin;
                        var y1 = 0 + margin;
                        var y2 = height - ctx.shadowOffsetY*2;
                        var y3 = height * 0.5;

                        //-- draw polygon path --//
                        // x1, y1
                        //  _________ x2,y1
                        // |        |
                        // |        |
                        // |________|
                        // x1,y3   x2,y2
                        //
                        ctx.beginPath();
                        ctx.moveTo(x1, y1);
                        ctx.lineTo(x2, y1);
                        ctx.lineTo(x2, y2);
                        ctx.lineTo(x1, y3);
                        ctx.lineTo(x1, y1);
                        ctx.closePath();
                        ctx.fill();
                    }

                }

                //-- Icon section --//
                Label{
                    id: lbl_Icon
                    width: implicitWidth
                    height: parent.height
                    anchors.right: parent.right
                    anchors.rightMargin: 20 * ratio
                    anchors.top: parent.top
                    anchors.topMargin: 10 * ratio
                    verticalAlignment: Qt.AlignVCenter
                    text: Icons.information_outline
                    font.family: webfont.name
                    font.pixelSize: Qt.application.font.pixelSize * 6
                    color: color1
                }

                //-- title --//
                Label{
                    text: "درباره ی ما"
                    color: color1
                    font.family: mainFont.name
                    font.pixelSize: Qt.application.font.pixelSize * 2
                    renderType: Text.NativeRendering

                    anchors.right: lbl_Icon.left
                    anchors.rightMargin: 8 * ratio
                    anchors.verticalCenter: lbl_Icon.verticalCenter
                }
            }

            //-- activity buttons -//
            Rectangle{
                width: parent.width
                height: parent.height - rec_head_activity.height
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom

                color: "#00ff0000"

                ScrollView {
                    id: frame
                    clip: true
                    anchors.fill: parent
                    Flickable {
                        id: flick
                        width: parent.width
                        contentHeight: txt.contentHeight + 50
                        Text{
                            id: txt
                            anchors.fill: parent
                            anchors.rightMargin: 30
                            anchors.leftMargin: 20
                            anchors.topMargin: 20
                            anchors.bottomMargin: 20
                            text: "این روزها به ندرت رمان عاشقانه‌ای خواهید یافت که درس زندگی دهد، یا اینکه قهرمانان کتاب در پایان با قلب مخاطب همراه شوند. اثر پرفروش من پیش از تو نوشته رمان‌نویس مشهور انگلیسی جوجو مویز از این دست کتاب‌ها است.

        کتاب با لوئیزا کلارک که دختری جوان و 26 ساله است شروع می‌شود. او که جاه طلب و موفق نیست، مدام در داشتن شغلی پایدار و همیشگی شکست می‌خورد. لوئیزا با سمت پیشخدمت در کافه‌ای محلی مشغول به کار است و شغلش به عنوان کمک درآمدی برای خانواده‌ فقیرش است. در ادامه داستان، دیری نمی‌گذرد که کارش را از دست می‌دهد.

        او که بسیار مأیوس شده، به سفارش دوست ورزشکارش «پاتریک» به مرکز کاریابی می‌رود. از آنجا او پیشنهاد مصاحبه برای سرپرستی فردی بالغ اما معلول را می‌پذیرد. او مرد جوانی به نام «ویل ترینر» می‌باشد که از طبقه بالای جامعه است. او روزگاری فردی بسیار پر جنب و جوش با آرزوهای بزرگ بود، ولی به علت تصادف با موتورسیکلت فلج شده و تمام وقت بر روی صندلی چرخ‌دار (ویلچر) نشسته و تمایل خود را برای زندگی از دست داده است. مادر ویل، کامیلا به خوبی می‌داند چگونه اوضاع را مدیریت کند تا روزی که او برای پایان دادن به نابسامانی‌های فرزندش، دختری شاد، سرزنده‌ و با احساس را که همان لوئیزا است را استخدام می‌کند.

        نویسنده باهوش سرشارش در دام عاشقانه‌های کلاسیک گرفتار نشده و بیشتر به دنبال نمایش و تأکید بر ویژگی‌های مهم زندگی است. این کتاب به ما می‌آموزد که چگونه زندگی را به چالش بکشیم و کجا باید داستانی عاشقانه و شیرین را در پس‌زمینه‌ای از رویدادهای آموزنده زندگی، نه با صدایی بلند و نه خیلی محو شده در عشقی خوش‌بینانه را دید. اگر شما به دنبال رمانی واقع‌بینانه هستید و نمی خواهید تنها سرانجام عشق را ببینید، باید به دوردست‌ها خیره شوید، جایی که داستان لوئیزا و ویل می‌خواهد تصوری پایدار در ذهن خواننده ایجاد کند.

        جوجو مویز، رمان من پیش از تو را بسیار روان نوشته است و با احساسات عمیق از سر آگاهی خواننده را متحول می‌کند. گفتگوها در کتاب خنده‌دار، جذاب و آزاد است. داستان دوستی بین لوئیزا کلارک و ویل ترینر از دل دعواها، ناسازگاری‌ها و سوء تفاهمات بیرون می‌آید.

        شخصیت‌های کتاب، واقعی و صادقانه رفتار می‌کنند و با نقص‌های خود به خوبی روبرو شده و سعی در برطرف کردنشان هستند. رفتار لوئیزا کلارک واقع گرایانه است و رشد شخصیت او به اندازه کافی قانع کننده است تا خواننده بتواند به خاطر شیرین بودن، طبیعت احساسی و تعلق خاطرش برای مراقبت از ویل، با او همزادپنداری کند. از سوی دیگر، ویل ممکن است ناراحت کننده، خودمحور و در عین حال شخصیتی ناخوشایند به نظر رسد و مخاطب تنها برای او تأسف می‌خورد. اما با پیشرفت داستان، می‌توان تصویری پرجنب‌و‌جوش از مردی سرشار از زندگی و عشق را دید.





        نویسنده تفسیر تازه‌ای از داستان‌های عاشقانه در سطوح رایجش را ارائه می‌دهد و از حساسیت‌های بی‌مورد بر مخاطب جلوگیری می‌کند. شخصیت‌ها فوراً در دام عشق نمی‌افتند، اما نخست دوستی و اعتماد را پرورش می‌دهند؛ زیرا آنها ناامیدی و سختی‌های زندگی را درک کرده‌اند. لوئیزا در بخشی از کتاب می‌گوید: «شما خوشحالی مرا می‌سازید، حتی زمانی که خیلی بداخلاق می‌شوید. من ترجیح می‌دهم با شما باشم، نسبت به هر کس دیگری در جهان.»

        با خواندن کتاب، گاهی ممکن است از سر خنده، دیوانه‌وار شاد شوید و یا گاهی سیل‌آسا اشک ریزید. جادوی کلمات از سوی نویسنده نه تنها قدرتمند، بلکه زیبا هستند و می‌توانند خواننده را با عمیق‌ترین احساسات درونی‌اش مواجه کند. به طور کلی، کتاب بسیار غیر منتظره و با حالتی بسیار دلهره‌آور به پایانش نزدیک می‌شود. قسمت‌های نخستین تا میانه‌های رمان روایتی ساده و مستقیم دارد، اما در نهایت، شما به نقطه‌ای می‌رسید که نمی‌توانید کتاب را به کنار بگذارید."
                            font.family: mainFaNumFont.name
                            color: color4
                            font.pixelSize: Qt.application.font.pixelSize * 1.5
                            wrapMode: Text.WordWrap
                            horizontalAlignment: Text.AlignLeft
                            LayoutMirroring.enabled: true
                        }
                    }
                }
            }
        }
    }
}
