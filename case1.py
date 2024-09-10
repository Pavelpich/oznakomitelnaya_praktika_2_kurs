"""
Кейс-задача № 1 
Дан одномерный массив А размерности N. Найти сумму отрицательных элементов, расположенных между максимальным и минимальным. 
Ответом на задачу будет ссылка на репозиторий GitHub, где хранится Ваша программа. Или иным удобным для Вас способом.
"""

def find_summ_from_array(arr:list[int]) -> int:

    max, min = arr[0], arr[0]
    max_index, min_index = 0, 0

    for indx in range(len(arr)):

        if arr[indx] > max:
            max_index = indx

        if arr[indx] < min:
            min_index = indx

    if max_index<min_index:
        min_index, max_index = max_index, min_index

    res = 0

    for indx in range(min_index, max_index):
        if arr[indx]



if __name__ == "__main__":
   res = find_summ_from_array([9, 3, 4,  1, -8, 7, -16, -1, -3, -19, 14])

   assert res == -23