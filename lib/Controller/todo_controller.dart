import 'package:flutter/cupertino.dart';
import 'package:todo_daap/Modals/todo.dart';
import 'package:web3dart/web3dart.dart';

class TodoController extends ChangeNotifier{
  List<Todo>todos = [];
  bool isLoading = true;
  late int todoCount;

  final String _rpcUrl = "";
  final String _wsUrl = "";

  final String _privateKey = "";

  late Web3Client _client;
  late String _abiCode;

  late Credentials _credentials;
  late EthereumAddress _contractAddress;

  late DeployedContract _contract;
  late ContractFunction _todoCount;
  late ContractFunction _todos;
  late ContractFunction _addTodo;
  late ContractFunction _deleteTodo;
  late ContractFunction _editTodo;
  late ContractEvent _todoAddedEvent;
  late ContractEvent _todoDeletedEvent;

  TodoController(){
    init();
  }

  init() async {

  }

}