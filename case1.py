"""
Кейс-задача № 1 
Дан одномерный массив А размерности N. Найти сумму отрицательных элементов, расположенных между максимальным и минимальным. 
Ответом на задачу будет ссылка на репозиторий GitHub, где хранится Ваша программа. Или иным удобным для Вас способом.
"""

def find_summ_from_array(A:list[int]) -> int:

    max, min = A[0], A[0]
    max_index, min_index = 0, 0

    for indx in range(len(A)):

        if A[indx] > max:
            max_index = indx
            max = A[indx]

        if A[indx] < min:
            min_index = indx
            min = A[indx]


    if max_index<min_index:
        min_index, max_index = max_index, min_index

    res = 0

    for indx in range(min_index+1, max_index):
        if A[indx] < 0:
            res += A[indx]

    return res



if __name__ == "__main__":
    try:
        res = find_summ_from_array([9, 3, 4,  1, -8, 7, -16, -1, 4, 7, -1, -3, -11, 14])

        assert res == -16

    except BaseException:
        print("Произошла ошибка, проверьте свои вводные данные")