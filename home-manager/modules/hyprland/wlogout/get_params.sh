# Получение разрешения экрана и коэффициента масштабирования
screen_width=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
screen_height=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
scale_factor=$(hyprctl -j monitors | jq '.[] | select(.focused == true) | .scale' | sed 's/\.//')

# Проверка аргумента для выбора стиля
style_index="${1:-1}"  # По умолчанию 1, если не указан

# Определение переменных в зависимости от выбранного стиля
case "${style_index}" in
    1)
        button_columns=3
        x_margin=$((screen_width * 32 / scale_factor))
        y_margin=$((screen_height * 28 / scale_factor))
        border_rad=$((screen_height / scale_factor / 3))
        ;;
    2)
        button_columns=2
        x_margin=$((screen_width * 38 / scale_factor))
        y_margin=$((screen_height * 28 / scale_factor))
        border_rad=$((screen_height / scale_factor / 3))
        ;;
    *)
        echo "Неверный индекс стиля. Используйте 1 или 2."
        exit 1
        ;;
esac

echo "button_columns=${button_columns}"
echo "x_margin=${x_margin}"
echo "y_margin=${y_margin}"
echo "border_rad=${border_rad}"

