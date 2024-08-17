class CinematicHUD extends SRHUDKillingFloor;

// Добавляем переменные для RGB значений
var float RedFilter;
var float GreenFilter;
var float BlueFilter;

simulated event PostRender(Canvas Canvas)
{
    super.PostRender(Canvas);

    // Применяем цветовой фильтр
    ApplyColorFilter(Canvas);
}

simulated function ApplyColorFilter(Canvas Canvas)
{
    local float ScreenWidth, ScreenHeight;

    ScreenWidth = Canvas.ClipX;
    ScreenHeight = Canvas.ClipY;

    // Накладываем цветовой фильтр на весь экран
    Canvas.Style = ERenderStyle.STY_Modulated;
    Canvas.SetPos(0, 0);
    Canvas.DrawColor.R = byte(RedFilter * 255);
    Canvas.DrawColor.G = byte(GreenFilter * 255);
    Canvas.DrawColor.B = byte(BlueFilter * 255);
    Canvas.DrawColor.A = 255;
    Canvas.DrawTile(Texture'Engine.WhiteTexture', ScreenWidth, ScreenHeight, 0, 0, 1, 1);

    // Восстанавливаем стиль отрисовки
    Canvas.Style = ERenderStyle.STY_Normal;
}

defaultproperties
{
    // Устанавливаем значения RGB фильтра
    RedFilter=0.5
    GreenFilter=0.5
    BlueFilter=0.5
}
