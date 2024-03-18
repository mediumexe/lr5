uses Crt;
const
  N = 100000; // максимальное значение в массиве

type
  TArray = array [1..N] of Integer;
  
 procedure Vyvod(var A: TArray; Size: Integer);
begin
    writeln('Отсортированный массив:');
    for var i := 1 to Size do
      write(A[i], ' ');
    writeln; 
    readkey;
    end;


procedure Heapify(var A: TArray; Size: Integer);
begin
  for var i:=1 to Size do
    for var j:=1 to Size-1 do
      if a[j]<a[j+1] then
      begin
        var g:=a[j];
        a[j]:=a[j+1];
        a[j+1]:=g;
      end;
end;

procedure CountingSort(var A: TArray; Size: Integer);
var
  Count: array [0..N] of Integer;
  Sorted: TArray;
  i: Integer;
begin
  // Инициализация массива Count
  for i := 0 to N do
    Count[i] := 0;

  // Подсчет количества каждого элемента в массиве A
  for i := 1 to Size do
    Inc(Count[A[i]]);

  // Вычисление позиции каждого элемента в отсортированном массиве
  for i := 1 to N do
    Count[i] := Count[i] + Count[i - 1];

  // Перенос элементов из массива A в отсортированный массив Sorted
  for i := Size downto 1 do
  begin
    Sorted[Count[A[i]]] := A[i];
    Dec(Count[A[i]]);
  end;
  // Копирование отсортированного массива в исходный массив A
  for i := 1 to Size do
    A[i] := Sorted[i];
  Vyvod(A, Size)
end;

var
  A: TArray;
  Size, i: Integer;
  InputFile: TextFile;
begin
  // Открытие файла для чтения
  AssignFile(InputFile, 'input.txt');
  Reset(InputFile);

  // Чтение размера массива
  ReadLn(InputFile, Size);

  // Чтение элементов массива
  for i := 1 to Size do
    ReadLn(InputFile, A[i]);

  // Закрытие файла
  CloseFile(InputFile);
var m:= 0;
repeat
    ClrScr;
    writeln('сортировка подсчётом - 1'); 
    writeln('быстрая сортировка - 2'); 
    m:=ReadInteger('select program:');
    case m of
      1: CountingSort(A, Size);
      2: Heapify(A, Size);
    end;
until m = 0;
end.