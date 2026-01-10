import 'package:notes_it/core/result/result.dart';
import 'package:notes_it/features/private_notes/domain/entities/priv_notes.dart';
import 'package:notes_it/features/private_notes/domain/repositories/priv_notes_repository.dart';

class DeletePrivNotes {
  final PrivNotesRepository privNotesRepository;

  DeletePrivNotes(this.privNotesRepository);

  Future<Result<void>> call(PrivNotes params) async {
    return await privNotesRepository.deletePrivNotes(params);
  }
}