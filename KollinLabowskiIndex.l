%{
typedef struct Node
{
	char message[20];
	struct Node* next;
	struct Node* prev;
} Node;

Node* head = NULL;
%}

%%
[A-Za-z0-9][A-Za-z0-9\-']* {

	if(head == NULL)
	{
		Node* new_head = malloc(sizeof(Node));

		for(int i = 0; i < 20; i++)
			new_head -> message[i] = yytext[i];
		new_head -> next = NULL;
		new_head -> prev = NULL;

		head = new_head;
	}
	else
	{
		Node* currNode = head;
		while(currNode -> next != NULL)
		{
			currNode = currNode -> next;
		}
		Node* new_node = malloc(sizeof(Node));
		for(int i = 0; i < 20; i++)
			new_node -> message[i] = yytext[i];
		//new_node -> message = yytext;
		new_node -> next = NULL;
		new_node -> prev = currNode;

		currNode -> next = new_node;
	}
}
.
\n
%%

/**
 * Name: Kollin Labowski
 * Course: CS 410
 * 
 * Description: This program is used to output into a table all words contained in a text file, as well as information about the chapter number and
 * the point at which each word occurs. Output is written to a .csv file, and input is read from a text file, using the < operator in the command line
*/

FILE *filePtr;
int chapter = -1;

int yywrap(){}
void main()
{

	filePtr = fopen("index01.csv", "w+");

	yylex();

	Node* currNode = head;
	int index = 1;
	while(currNode != NULL)
	{
		if(strcmp(currNode -> message, "Chapter") == 0)
		{
			chapter = atoi(currNode -> next -> message);
			index = 1;
		}

		fprintf(filePtr, "%s, %d, %d, ", currNode -> message, chapter, index);

		Node* backwardPtr = currNode;
		int backwardCounter = 0;
		for(int i = 0; i < 5; i++)
		{
			if(backwardPtr -> prev != NULL)
			{
				backwardPtr = backwardPtr -> prev;
				backwardCounter++;
			}
		}

		for(int i = 0; i < backwardCounter; i++)
		{
			fprintf(filePtr, "%s ", backwardPtr -> message);
			backwardPtr = backwardPtr -> next;
		}

		fprintf(filePtr, ", ");

		Node* forwardPtr = currNode;
		for(int i = 0; i < 5; i++)
		{
			if(forwardPtr -> next != NULL)
			{
				forwardPtr = forwardPtr -> next;
				fprintf(filePtr, "%s ", forwardPtr -> message);
			}
		}

		index++;
		currNode = currNode -> next;
		fprintf(filePtr, "\n");
	}

	fclose(filePtr);
}