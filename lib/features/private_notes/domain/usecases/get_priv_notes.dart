import 'package:notes_it/core/result/result.dart';
import 'package:notes_it/core/usecases/usecase.dart';
import 'package:notes_it/features/private_notes/domain/entities/priv_notes.dart';
import 'package:notes_it/features/private_notes/domain/repositories/priv_notes_repository.dart';

class GetPrivNotes {
  final PrivNotesRepository privNotesRepository;

  GetPrivNotes(this.privNotesRepository);

  Future<Result<void>> call(NoParams params) async {
    return await privNotesRepository.getPrivNotes();
  }
}